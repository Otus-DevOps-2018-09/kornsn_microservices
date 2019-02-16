USER_NAME=kornsn
export USER_NAME


all:
	echo Hello

build_prometheus:
	docker build -t $(USER_NAME)/prometheus monitoring/prometheus

build_alertmanager:
	docker build -t $(USER_NAME)/alertmanager monitoring/alertmanager

build_comment:
	cd src/comment && sh docker_build.sh

build_post:
	cd src/post-py && sh docker_build.sh

build_ui:
	cd src/ui && sh docker_build.sh

build_app: build_comment build_post build_ui

push_all:
	docker push $(USER_NAME)/ui
	docker push $(USER_NAME)/comment
	docker push $(USER_NAME)/post
	docker push $(USER_NAME)/prometheus
	docker push $(USER_NAME)/alertmanager

start_app:
	cd docker && docker-compose -f docker-compose.yml up -d

start_monitoring:
	cd docker && docker-compose -f docker-compose-monitoring.yml up -d

start_all: start_app start_monitoring
