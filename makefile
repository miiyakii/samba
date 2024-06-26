include info
build:
	docker build -t $(IMAGE_NAME):${IMAGE_TAG} .
run:
	docker compose up -d 