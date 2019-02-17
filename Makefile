USER_NAME=kornsn
export USER_NAME


all:
	echo Hello

build_prometheus:
	docker build -t $(USER_NAME)/prometheus monitoring/prometheus

build_alertmanager:
	docker build -t $(USER_NAME)/alertmanager monitoring/alertmanager

build_fluentd:
	docker build -t $(USER_NAME)/fluentd logging/fluentd

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
	docker push $(USER_NAME)/fluentd

start_app:
	cd docker && docker-compose -f docker-compose.yml up -d

start_monitoring:
	cd docker && docker-compose -f docker-compose-monitoring.yml up -d

start_logging:
	cd docker && docker-compose -f docker-compose-logging.yml up -d

start_all: start_logging start_monitoring start_app

stop_app:
	cd docker && docker-compose -f docker-compose.yml down

stop_monitoring:
	cd docker && docker-compose -f docker-compose-monitoring.yml down

stop_logging:
	cd docker && docker-compose -f docker-compose-logging.yml down


stop_all: stop_app stop_monitoring stop_logging

logs_logging:
	cd docker && docker-compose -f docker-compose-logging.yml logs fluentd
