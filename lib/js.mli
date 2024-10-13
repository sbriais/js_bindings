module Node = Node
module JSON = JSON
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
module Blob = Blob
module Document = Document
module Element = Element
module HTMLElement = HTMLElement
module HTMLInputElement = HTMLInputElement
module File = File
module FileReader = FileReader

module ObjectURL : sig
  val of_blob: Blob.t -> string [@@js.global "URL.createObjectURL"]
  val revoke: string -> unit [@@js.global "URL.revokeObjectURL"]
end

val window: Window.t [@@js.global]
val navigator: Navigator.t [@@js.global]
val document: Document.t [@@js.global]

val caches: Cache.CacheStorage.t [@@js.global]

val fetch: ([`String of string | `Request of Fetch.Request.t] [@js.union]) -> Fetch.Response.t Promise.t [@@js.global "fetch"]
