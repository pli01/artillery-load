export TARGET := ${TARGET}
build:
	docker-compose -f docker-compose-artillery.yml build
run-load:
	for i in scenario/*.yml ; do \
	 o=$$(basename $$i .yml); \
	 docker-compose -f docker-compose-artillery.yml run -e HTTP_PROXY=$$http_proxy -e NO_PROXY=$$no_proxy --rm artillery run -o reports/$$o.json -e prod -t "${TARGET}" $$i ; \
	done
generate-report:
	for i in scenario/*.yml ; do \
	 o=$$(basename $$i .yml); \
	 docker-compose -f docker-compose-artillery.yml run --rm artillery report reports/$$o.json ; \
	done
publish-report:
	for i in reports/*.json.html ; do \
	  cp $$i docs/ ; \
	done
clean-report:
	for i in reports/*.json ; do \
	  rm -rf $$i ; \
	done
