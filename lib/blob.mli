type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

type options
val options: ?type_:string -> ?endings:string -> unit -> options [@@js.builder]

val create: Ojs.t list -> ?options:options -> unit -> t [@@js.new "Blob"]
