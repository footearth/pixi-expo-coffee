export PATH := ./node_modules/.bin:$(PATH)

include ./node_modules/cfx.simple-build-tool/maker/main.mk

pjName := pixi-expo-coffee

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 3080:80 \
		-p 3088:8080 \
		-p 3030:3000 \
		-p 3000:8000 \
		-p 3050:5000 \
		-p 3040:4000 \
		-p 1234:1234 \
		-p 19000:19000 \
		-p 19002:19002 \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

in:
	docker exec \
		-ti \
		${pjName} \
		/bin/bash
