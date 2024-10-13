(rule
  (targets event.ml)
  (deps event.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets DOMStringList.ml)
  (deps DOMStringList.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets indexedDB.ml)
  (deps indexedDB.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets window.ml)
  (deps window.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets js.ml)
  (deps js.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets storage.ml)
  (deps storage.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets JSON.ml)
  (deps JSON.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets date.ml)
  (deps date.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets node.ml)
  (deps node.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets navigator.ml)
  (deps navigator.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets serviceWorker.ml)
  (deps serviceWorker.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets promise.ml)
  (deps promise.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets fetch.ml)
  (deps fetch.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets cache.ml)
  (deps cache.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(rule
  (targets location.ml)
  (deps location.mli)
  (action
    (run %{bin:gen_js_api} %{deps})))
(library
  (name js)
  (public_name js_bindings)
  (modules event DOMStringList indexedDB window js storage JSON date node navigator serviceWorker promise fetch cache location)
  (libraries gen_js_api))
