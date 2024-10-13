module UntypedPromise : sig

  type t = private Ojs.t
  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  [@@@js.stop]
  val return: Ojs.t -> t
  val fail: Ojs.t -> t
  val bind: ?error:(Ojs.t -> t) -> t -> (Ojs.t -> t) -> t
  val then_: ?error:(Ojs.t -> unit) -> success:(Ojs.t -> unit) -> t -> unit
  val all: Ojs.t list -> t
  [@@@js.start]

  [@@@js.implem
    val resolve: Ojs.t -> Ojs.t [@@js.global "Promise.resolve"]
    val reject: Ojs.t -> Ojs.t [@@js.global "Promise.reject"]
    val then_: Ojs.t -> success:(Ojs.t -> Ojs.t) -> error:(Ojs.t -> Ojs.t) -> Ojs.t [@@js.call "then"]
    val all: Ojs.t list -> Ojs.t [@@js.global "Promise.all"]

    type wrap = { content: Ojs.t }[@@js]

    let is_promise o =
      resolve o == o

    let wrap o =
      if is_promise o then
        wrap_to_js { content = o }
      else o

    let unwrap o =
      if Ojs.has_property o "content" then
        Ojs.get_prop_ascii o "content"
      else
        o

    let return x = resolve (wrap x)
    let fail err = reject (wrap err)
    let bind ?(error = fail) p f =
      then_ p ~success:(fun x -> f (unwrap x))
        ~error:(fun x -> error (unwrap x))
    let then_ ?error ~success p =
      let error =
        match error with
        | None -> fail
        | Some f -> fun err -> f err; Ojs.null
      in
      let f x = success x; Ojs.null in
      ignore (bind ~error p f)
  ]
end

[@@@js.stop]
type 'a t
val t_to_js: ('a -> Ojs.t) -> 'a t -> Ojs.t
val t_of_js: (Ojs.t -> 'a) -> Ojs.t -> 'a t

type error = Ojs.t

val fail: error -> 'a t
val return: 'a -> 'a t
val bind: ?error:(error -> 'b t) -> 'a t -> ('a -> 'b t) -> 'b t
val map: ('a -> 'b) -> 'a t -> 'b t
val prod: 'a t -> 'b t -> ('a * 'b) t
val then_: ?error:(error -> unit) -> success:('a -> unit) -> 'a t -> unit
val all: 'a t list -> 'a list t

module List : sig
  val map: ('a -> 'b t) -> 'a list -> 'b list t
end

module Option : sig
  val map: ('a -> 'b t) -> 'a option -> 'b option t
end

module O : sig
  val ( let+ ): 'a t -> ('a -> 'b) -> 'b t
  val ( and+ ): 'a t -> 'b t -> ('a * 'b) t
  val ( let* ): 'a t -> ('a -> 'b t) -> 'b t
  val ( and* ): 'a t -> 'b t -> ('a * 'b) t
end

val catch: 'a t -> (error -> 'a t) -> 'a t

[@@@js.start]
[@@@js.implem
  type 'a t = UntypedPromise.t
  type error = Ojs.t
  let fail error = UntypedPromise.fail  error
  let return x = UntypedPromise.return (Obj.magic x)
  let bind ?error p f =
    UntypedPromise.bind ?error p
      (fun x -> f (Obj.magic x))
  let then_ ?error ~success p =
    UntypedPromise.then_ ?error
      ~success:(fun x -> success (Obj.magic x)) p

  let prod p1 p2 =
    bind (UntypedPromise.all [p1; p2])
      (fun ojs ->
         match Ojs.list_of_js Ojs.t_of_js ojs with
         | [x1; x2] -> return (x1, x2)
         | _ -> assert false
      )
  let map f p = bind p (fun x -> return (f x))
  let t_to_js f p = UntypedPromise.t_to_js (map f p)
  let t_of_js f p = map f (UntypedPromise.t_of_js p)

  let all l = map (Ojs.list_of_js Ojs.t_of_js) (UntypedPromise.all l)

  module List = struct
    let map f l =
      all (List.map f l)
  end

  module Option = struct
    let map f = function
      | None -> return None
      | Some x -> map Option.some (f x)
  end

  module O = struct
    let (let+) p f = map f p
    let (and+) = prod
    let (let*) p f = bind p f
    let (and*) = prod
  end

  let catch p error = bind p ~error return
]
