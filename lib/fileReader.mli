type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val create: unit -> t [@@js.new "FileReader"]

val as_event_target: t -> Event.target [@@js.cast]

val txt_result: t -> string [@@js.get "result"]

val read_as_text: t -> File.t -> unit [@@js.call]
