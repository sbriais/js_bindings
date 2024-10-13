type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val files: t -> File.t list [@@js.get]
