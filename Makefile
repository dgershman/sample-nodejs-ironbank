.PHONY: build
build:
	docker build . -t radius314/dg-test-nodejs-postgres

run:
	docker run -i -p 3000:3000 sample-nodejs-ironbank

push:
	docker push radius314/dg-test-nodejs-postgres

install:
	helm upgrade --install test ./chart --namespace test --create-namespace

uninstall:
	helm uninstall test

postgres:
	docker run -i -p 5432:5432 -e POSTGRES_USER=test -e POSTGRES_PASSWORD=test -e POSTGRES_DATABASE=test postgres

