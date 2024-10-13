type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val reload: t -> unit [@@js.call]
