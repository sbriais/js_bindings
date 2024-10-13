FILES=
FILES+=event.mli
FILES+=indexedDB.mli
FILES+=window.mli
FILES+=js.mli
FILES+=storage.mli
FILES+=JSON.mli
FILES+=date.mli
FILES+=node.mli
FILES+=navigator.mli
FILES+=serviceWorker.mli
FILES+=promise.mli
FILES+=fetch.mli
FILES+=cache.mli
FILES+=location.mli
FILES+=element.mli
FILES+=document.mli
FILES+=blob.mli
FILES+=HTMLElement.mli
FILES+=HTMLInputElement.mli
FILES+=file.mli
FILES+=fileReader.mli

dune.inc: $(FILES)
	for i in $^; do \
	  echo '(rule'; \
	  printf "  (targets %s)\n" "$${i%.mli}.ml"; \
	  printf "  (deps %s)\n" $$i; \
	  echo '  (action'; \
	  echo '    (run %{bin:gen_js_api} %{deps})))'; \
	done > $@; \
	echo '(library' >> $@; \
	echo '  (name js)' >> $@; \
	echo '  (public_name js_bindings)' >> $@; \
	echo -n '  (modules' >> $@; \
	for i in $^; do \
	  printf " %s" "$${i%.mli}"; \
	done >> $@; \
	echo ')' >> $@; \
	echo '  (libraries gen_js_api))' >> $@
