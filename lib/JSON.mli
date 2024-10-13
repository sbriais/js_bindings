val parse: string -> Ojs.t [@@js.global "JSON.parse"]
val stringify: Ojs.t -> string [@@js.global "JSON.stringify"]
val is_raw_JSON: Ojs.t -> bool [@@js.global "JSON.isRawJSON"]
val raw_JSON: Ojs.t -> string [@@js.global "JSON.rawJSON"]

