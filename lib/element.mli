type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val as_event_target: t -> Event.target [@@js.cast]

val set_attribute: t -> string -> string -> unit [@@js.call]

val click: t -> unit [@@js.call]
