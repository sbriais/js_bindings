module Node = Node
module JSON = JSON
module DOMStringList = DOMStringList
module Event = Event
module IndexedDB = IndexedDB
module Storage = Storage
module Location = Location
module Window = Window
module Date = Date
module Navigator = Navigator
module ServiceWorker = ServiceWorker
module Promise = Promise
module Fetch = Fetch
module Cache = Cache

val window: Window.t [@@js.global]
val navigator: Navigator.t [@@js.global]

val caches: Cache.CacheStorage.t [@@js.global]

val fetch: ([`String of string | `Request of Fetch.Request.t] [@js.union]) -> Fetch.Response.t Promise.t [@@js.global "fetch"]
