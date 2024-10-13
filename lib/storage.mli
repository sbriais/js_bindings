type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val length: t -> int [@@js.get]
val key: t -> int -> string option [@@js.call]
val get_item: t -> string -> string option [@@js.call]
val set_item: t -> string -> string -> unit [@@js.call]
val remove_item: t -> string -> unit [@@js.call]
val clear: t -> unit [@@js.call]
