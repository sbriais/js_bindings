type t

val t_to_js: t -> Ojs.t
val t_of_js: Ojs.t -> t

val service_worker: t -> ServiceWorker.Container.t option
[@@js.custom
  val service_worker: t -> ServiceWorker.Container.t [@@js.get]

  let service_worker x =
    if Ojs.has_property x "serviceWorker" then Some (service_worker x)
    else None
]
