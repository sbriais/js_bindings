module Request: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val url: t -> string [@@js.get]
end

module Response: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val text: t -> string Promise.t [@@js.call]
end

module Event: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val request: t -> Request.t [@@js.get]

  val respond_with: t -> ([`Response of Response.t | `Promise of Response.t Promise.t] [@js.union]) -> unit [@@js.call]
end
