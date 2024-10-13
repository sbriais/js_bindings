module IDBRequest: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val as_event_target: t -> Event.target [@@js.cast]

  type ready_state =
    | Pending [@js "pending"]
    | Done [@js "done"]
  [@@js.enum]

  val ready_state: t -> ready_state [@@js.get]

  val result: t -> Ojs.t option [@@js.get]
end

module IDBOpenDBRequest: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val as_db_request: t -> IDBRequest.t [@@js.cast]
end

module IDBObjectStore: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val get: t -> Ojs.t -> IDBRequest.t [@@js.call]
  val put: t -> Ojs.t -> IDBRequest.t [@@js.call]
  val delete: t -> Ojs.t -> IDBRequest.t [@@js.call]
  val clear: t -> IDBRequest.t [@@js.call]
end

module IDBTransaction: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  type mode =
    | Readonly [@js "readonly"]
    | Readwrite [@js "readwrite"]
    | Readwriteflush [@js "readwriteflush"]
  [@@js.enum]

  type durability =
    | Strict [@js "strict"]
    | Relaxed [@js "relaxed"]
    | Default [@js "default"]
  [@@js.enum]

  val object_store: t -> string -> IDBObjectStore.t [@@js.call]
end

module IDBDatabase: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val name: t -> string [@@js.get]
  val version: t -> int [@@js.get]

  val object_store_names: t -> string list [@@js.get]

  val close: t -> unit [@@js.call]

  type create_options
  val create_options:
    ?key_path:string ->
    ?auto_increment:bool ->
    unit ->
    create_options [@@js.builder]

  val create_object_store: t -> string -> ?options:create_options -> unit -> IDBObjectStore.t [@@js.call]

  val delete_object_store: t -> string -> unit [@@js.call]

  type transaction_options
  val transaction_options:
    durability:IDBTransaction.durability ->
    transaction_options [@@js.builder]

  val transaction: t -> string -> ?mode:IDBTransaction.mode -> ?options:transaction_options -> unit -> IDBTransaction.t [@@js.call]
end

module IDBFactory: sig
  type t
  val t_of_js: Ojs.t -> t
  val t_to_js: t -> Ojs.t

  val open_: t -> string -> ?version:int -> unit -> IDBOpenDBRequest.t [@@js.call "open"]
end

val indexedDB: Window.t -> IDBFactory.t option [@@js.get]
