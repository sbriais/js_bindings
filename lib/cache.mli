module Cache: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val add_all: t -> string array -> unit Promise.t [@@js.call]
  val add: t -> string -> unit Promise.t [@@js.call]
end

module CacheStorage: sig
  type t

  val t_to_js: t -> Ojs.t
  val t_of_js: Ojs.t -> t

  val open_: t -> string -> Cache.t Promise.t [@@js.call "open"]
  val match_: t -> Fetch.Request.t -> Fetch.Response.t option Promise.t [@@js.call "match"]
  val keys: t -> string list Promise.t [@@js.call]
  val delete: t -> string -> bool Promise.t [@@js.call]
end
