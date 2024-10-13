type t
val t_of_js: Ojs.t -> t
val t_to_js: t -> Ojs.t

type target
val target_to_js: target -> Ojs.t
val target_of_js: Ojs.t -> target

(* see https://developer.mozilla.org/en-US/docs/Web/Events *)
type type_ =
  | Abort [@js "abort"]
  | Activate [@js "activate"]
  | Afterprint [@js "afterprint"]
  | Animationend [@js "animationend"]
  | Animationiteration [@js "animationiteration"]
  | Animationstart [@js "animationstart"]
  | Appinstalled [@js "appinstalled"]
  | Audioend [@js "audioend"]
  | Audioprocess [@js "audioprocess"]
  | Audiostart [@js "audiostart"]
  | Beforeprint [@js "beforeprint"]
  | Beforeunload [@js "beforeunload"]
  | BeginEvent [@js "beginEvent"]
  | Blocked [@js "blocked"]
  | Blur [@js "blur"]
  | Boundary [@js "boundary"]
  | Cached [@js "cached"]
  | Canplay [@js "canplay"]
  | Canplaythrough [@js "canplaythrough"]
  | Change [@js "change"]
  | Chargingchange [@js "chargingchange"]
  | Chargingtimechange [@js "chargingtimechange"]
  | Checking [@js "checking"]
  | Click [@js "click"]
  | Close [@js "close"]
  | Complete [@js "complete"]
  | Compositionend [@js "compositionend"]
  | Compositionstart [@js "compositionstart"]
  | Compositionupdate [@js "compositionupdate"]
  | Contextmenu [@js "contextmenu"]
  | Controllerchange [@js "controllerchange"]
  | Copy [@js "copy"]
  | Cut [@js "cut"]
  | Dblclick [@js "dblclick"]
  | Devicechange [@js "devicechange"]
  | Devicelight [@js "devicelight"]
  | Devicemotion [@js "devicemotion"]
  | Deviceorientation [@js "deviceorientation"]
  | Deviceproximity [@js "deviceproximity"]
  | Dischargingtimechange [@js "dischargingtimechange"]
  | DOMActivate [@js "DOMActivate"]
  | DOMAttributeNameChanged [@js "DOMAttributeNameChanged"]
  | DOMAttrModified [@js "DOMAttrModified"]
  | DOMCharacterDataModified [@js "DOMCharacterDataModified"]
  | DOMContentLoaded [@js "DOMContentLoaded"]
  | DOMElementNameChanged [@js "DOMElementNameChanged"]
  | DOMFocusIn [@js "DOMFocusIn"]
  | DOMFocusOut [@js "DOMFocusOut"]
  | DOMNodeInserted [@js "DOMNodeInserted"]
  | DOMNodeInsertedIntoDocument [@js "DOMNodeInsertedIntoDocument"]
  | DOMNodeRemoved [@js "DOMNodeRemoved"]
  | DOMNodeRemovedFromDocument [@js "DOMNodeRemovedFromDocument"]
  | DOMSubtreeModified [@js "DOMSubtreeModified"]
  | Downloading [@js "downloading"]
  | Drag [@js "drag"]
  | Dragend [@js "dragend"]
  | Dragenter [@js "dragenter"]
  | Dragleave [@js "dragleave"]
  | Dragover [@js "dragover"]
  | Dragstart [@js "dragstart"]
  | Drop [@js "drop"]
  | Durationchange [@js "durationchange"]
  | Emptied [@js "emptied"]
  | End [@js "end"]
  | Ended [@js "ended"]
  | EndEvent [@js "endEvent"]
  | Error [@js "error"]
  | Fetch [@js "fetch"]
  | Focus [@js "focus"]
  | Focusin [@js "focusin"]
  | Focusout [@js "focusout"]
  | Fullscreenchange [@js "fullscreenchange"]
  | Fullscreenerror [@js "fullscreenerror"]
  | Gamepadconnected [@js "gamepadconnected"]
  | Gamepaddisconnected [@js "gamepaddisconnected"]
  | Gotpointercapture [@js "gotpointercapture"]
  | Hashchange [@js "hashchange"]
  | Input [@js "input"]
  | Install [@js "install"]
  | Invalid [@js "invalid"]
  | Keydown [@js "keydown"]
  | Keypress [@js "keypress"]
  | Keyup [@js "keyup"]
  | Languagechange [@js "languagechange"]
  | Levelchange [@js "levelchange"]
  | Load [@js "load"]
  | Loadeddata [@js "loadeddata"]
  | Loadedmetadata [@js "loadedmetadata"]
  | Loadend [@js "loadend"]
  | Loadstart [@js "loadstart"]
  | Lostpointercapture [@js "lostpointercapture"]
  | Mark [@js "mark"]
  | Message [@js "message"]
  | Messageerror [@js "messageerror"]
  | Mousedown [@js "mousedown"]
  | Mouseenter [@js "mouseenter"]
  | Mouseleave [@js "mouseleave"]
  | Mousemove [@js "mousemove"]
  | Mouseout [@js "mouseout"]
  | Mouseover [@js "mouseover"]
  | Mouseup [@js "mouseup"]
  | Nomatch [@js "nomatch"]
  | Notificationclick [@js "notificationclick"]
  | Noupdate [@js "noupdate"]
  | Obsolete [@js "obsolete"]
  | Offline [@js "offline"]
  | Online [@js "online"]
  | Open [@js "open"]
  | Orientationchange [@js "orientationchange"]
  | Pagehide [@js "pagehide"]
  | Pageshow [@js "pageshow"]
  | Paste [@js "paste"]
  | Pause [@js "pause"]
  | Play [@js "play"]
  | Playing [@js "playing"]
  | Pointercancel [@js "pointercancel"]
  | Pointerdown [@js "pointerdown"]
  | Pointerenter [@js "pointerenter"]
  | Pointerleave [@js "pointerleave"]
  | Pointerlockchange [@js "pointerlockchange"]
  | Pointerlockerror [@js "pointerlockerror"]
  | Pointermove [@js "pointermove"]
  | Pointerout [@js "pointerout"]
  | Pointerover [@js "pointerover"]
  | Pointerup [@js "pointerup"]
  | Popstate [@js "popstate"]
  | Progress [@js "progress"]
  | Push [@js "push"]
  | Pushsubscriptionchange [@js "pushsubscriptionchange"]
  | Ratechange [@js "ratechange"]
  | Readystatechange [@js "readystatechange"]
  | RepeatEvent [@js "repeatEvent"]
  | Reset [@js "reset"]
  | Resize [@js "resize"]
  | Resourcetimingbufferfull [@js "resourcetimingbufferfull"]
  | Result [@js "result"]
  | Resume [@js "resume"]
  | Scroll [@js "scroll"]
  | Seeked [@js "seeked"]
  | Seeking [@js "seeking"]
  | Select [@js "select"]
  | Selectionchange [@js "selectionchange"]
  | Selectstart [@js "selectstart"]
  | Show [@js "show"]
  | Slotchange [@js "slotchange"]
  | Soundend [@js "soundend"]
  | Soundstart [@js "soundstart"]
  | Speechend [@js "speechend"]
  | Speechstart [@js "speechstart"]
  | Stalled [@js "stalled"]
  | Start [@js "start"]
  | Storage [@js "storage"]
  | Submit [@js "submit"]
  | Success [@js "success"]
  | Suspend [@js "suspend"]
  | SVGAbort [@js "SVGAbort"]
  | SVGError [@js "SVGError"]
  | SVGLoad [@js "SVGLoad"]
  | SVGResize [@js "SVGResize"]
  | SVGScroll [@js "SVGScroll"]
  | SVGUnload [@js "SVGUnload"]
  | SVGZoom [@js "SVGZoom"]
  | Timeout [@js "timeout"]
  | Timeupdate [@js "timeupdate"]
  | Touchcancel [@js "touchcancel"]
  | Touchend [@js "touchend"]
  | Touchmove [@js "touchmove"]
  | Touchstart [@js "touchstart"]
  | Transitionend [@js "transitionend"]
  | Unload [@js "unload"]
  | Updateready [@js "updateready"]
  | Upgradeneeded [@js "upgradeneeded"]
  | Userproximity [@js "userproximity"]
  | Versionchange [@js "versionchange"]
  | Visibilitychange [@js "visibilitychange"]
  | Voiceschanged [@js "voiceschanged"]
  | Volumechange [@js "volumechange"]
  | Waiting [@js "waiting"]
  | Wheel [@js "wheel"]
  | NonStandard of string [@js.default]
[@@js.enum]

val add_event_listener: target -> type_ -> (t -> unit) -> bool -> unit [@@js.call]
val add_cancellable_event_listener: target -> type_ -> (t -> unit) -> bool -> (unit -> unit)
[@@js.custom
  val add_event_listener_internal: target -> type_ -> Ojs.t -> bool -> unit
  [@@js.call "addEventListener"]
  val remove_event_listener_internal: target -> type_ -> Ojs.t -> bool -> unit
  [@@js.call "removeEventListener"]
  let add_cancellable_event_listener x k f c =
    let f = Ojs.fun_to_js 1 (fun x -> f (t_of_js x)) in
    add_event_listener_internal x k f c;
    fun () ->
      remove_event_listener_internal x k f c
                                                                             ]

val bubbles: t -> bool [@@js.get]

val cancelable: t -> bool [@@js.get]

val composed: t -> bool [@@js.get]

val current_target: t -> target [@@js.get]

val default_prevented: t -> bool [@@js.get]

type phase =
  | None [@js 0]
  | Capturing_phase [@js 1]
  | At_target [@js 2]
  | Bubbling_phase [@js 3]
[@@js.enum]

val event_phase: t -> phase [@@js.get]

val is_trusted: t -> bool [@@js.get]

val target: t -> target [@@js.get]

(* val timestamp: t -> DOMHighResTimeStamp.t [@@js.get] *)

val type_: t -> type_ [@@js.get "type"]

val composed_path: t -> target array [@@js.call]

val prevent_default: t -> unit [@@js.call]

val stop_immediate_propagation: t -> unit [@@js.call]

val stop_propagation: t -> unit [@@js.call]