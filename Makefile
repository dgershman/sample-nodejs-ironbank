.PHONY: build
build:
	docker build . -t radius314/dg-test-nodejs-postgres

run:
	docker run -i -p 3000:3000 sample-nodejs-ironbank

push:
	docker push radius314/dg-test-nodejs-postgres

deploy:
	helm upgrade --install test ./chart