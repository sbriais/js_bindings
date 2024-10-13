type t
val t_of_js: Ojs.t -> t
val t_to_js: t -> Ojs.t

val length: t -> int [@@js.get]
val item: t -> int -> string [@@js.call]
val contains: t -> string -> bool [@@js.call]
