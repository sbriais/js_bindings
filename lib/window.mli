type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val as_event_target: t -> Event.target [@@js.cast]

val session_storage: t -> Storage.t option [@@js.get]
val local_storage: t -> Storage.t option [@@js.get]

val location: t -> Location.t [@@js.get]
