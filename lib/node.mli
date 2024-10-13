type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val append_child: t -> (* new child *) t -> unit [@@js.call]
