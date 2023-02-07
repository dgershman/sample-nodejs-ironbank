.PHONY: build
build:
	docker build . -t sample-nodejs-ironbank

run:
	docker run -i -p 3000:3000 sample-nodejs-ironbank
