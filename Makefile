.PHONY: all build publish

BUCKET_NAME := thiccbois.io

all: build publish

build:
	hugo -v 

publish:
	aws s3 sync --acl "public-read" --sse "AES256" public/ s3://${BUCKET_NAME} --exclude 'post'
