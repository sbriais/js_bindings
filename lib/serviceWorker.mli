module ExtendableEvent: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val wait_until: t -> 'a Promise.t -> unit [@@js.call]
end

module Worker: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val script_url: t -> string [@@js.get "scriptURL"]
end

module Clients: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val claim: t -> unit Promise.t [@@js.call]
end

module GlobalScope: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val as_event_target: t -> Event.target [@@js.cast]

  val service_worker: t -> Worker.t [@@js.get]

  val clients: t -> Clients.t [@@js.get]

  val skip_waiting: t -> unit [@@js.call]
end

module Registration: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val as_event_target: t -> Event.target [@@js.cast]

  val scope: t -> string [@@js.get]
end

module Container: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val register: t -> string -> Registration.t Promise.t [@@js.call]

  val as_event_target: t -> Event.target [@@js.cast]
end
