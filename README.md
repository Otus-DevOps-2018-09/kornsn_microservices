# kornsn_microservices
kornsn microservices repository



## Docker-1 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=docker-1)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

### Docker version:
```
Client:
 Version:           18.09.0
 API version:       1.39
 Go version:        go1.10.4
 Git commit:        4d60db4
 Built:             Wed Nov  7 00:48:57 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.0
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.4
  Git commit:       4d60db4
  Built:            Wed Nov  7 00:16:44 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```


Что сделано:

- установлен docker
- изучены команды:
    - создания контейнера `docker create` или `docker container create`
    - запуска контейнера `docker start` или `docker container start`
    - присоединения к контейнеру `docker attach` или `docker container attach`
    - запуска контейнера одной командой `docker run` или `docker container run`
    - запустить ещё один процесс внутри контейнера `docker exec` или `docker container exec`
    - остановки контейнера `docker stop` или `docker container stop`
    - послать сигнал контейнеру `docker kill` или `docker container kill`
    - создание образов с помощью коммита контейнера `docker commit` или `docker container commit`
    - удаление остановленных контейнеров `docker rm $(docker ps -a -q)` или `docker container prune`
    - показать используемые системные ресурсы `docker system df`
    - освободить неиспользуемые системные ресурсы `docker system prune`



## Docker-2 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

Что сделано:
- Установлен docker-machine
- Создан docker host в gcp с помощью docker-machine
- Создан docker образ с базой данных и приложением с помощью Dockerfile
- Созданный образ сохранен в docker hub
- Сделано поднятие инстансов приложения в gcp из ранее созданного образа с помощью Terraform
- Создан плейбук ansible с использованием динамического инвентори для установки докера и запуска там образа приложения
- Создан шаблон пакера, который делает образ с уже установленным Docker



## Docker-3 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=docker-3)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

Что сделано:
- Скопированы исходные коды микросервисов
- Созданы Dockerfile для каждого микросервиса
- Образы соптимизированы таким образом, чтобы по максимуму использовать кэш
- Образы соптимизированы по размеру -- в качестве базовых образов использованы соответствующие alpine образы
- Создан и подключен Volume для хранения данных MongoDB



## Docker-4 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=docker-4)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

Как задать базовое имя проекта:
```bash
docker-compose -p <your-project-name> <command>
```

Что сделано:
- Изучена работа с сетями в docker
- Создан и параметризирован файл docker-compose
- Поднят тестовый кластер с помощью docker-compose
- Создан файл docker-compose.override.yml, который позволяет:
    - Изменять код каждого из приложений, не выполняя сборку образа
    - Запускать puma для руби приложений в дебаг режиме с двумя воркерами



## Gitlab-CI-1 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=gitlab-ci-1)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

Что сделано:
- Установлен Gitlab-CI CE на машину в облаке GCP с помощью docker-compose
- Создан тестовый проект
- Настроен пайплайн для тестового проекта
- Сделана интеграция с каналом [slack](https://devops-team-otus.slack.com/messages/CDMRXRXTK/?).



## Gitlab-CI-2 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=gitlab-ci-2)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

Что сделано:
- Написана конфигурация для установки Gitlab-CI CE в облако GCP с помощью terraform и ansible
- Дополнен CI/CD пайплайн -- добавлены окружения:
    - dev -- автоматическое
    - stage -- ручное
    - prod -- ручное
    - динамическое окружение на каждую фича-ветку
- Для окружений stage и prod добавлено ограничение, что они могут создаваться только для коммитов, содержащих semver тэг



## Monitoring-1 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=monitoring-1)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

[Докер хаб с собранными образами здесь](https://hub.docker.com/u/kornsn)

Что сделано:
- Написана новая конфигурация микросервисов, включающая в себя мониторинг
  с помощью Prometheus
- Мониторятся:
    - ui
    - comment
    - post
    - prometheus
    - node



## Monitoring-2 [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices.svg?branch=monitoring-2)](https://travis-ci.com/Otus-DevOps-2018-09/kornsn_microservices)

[Докер хаб с собранными образами здесь](https://hub.docker.com/u/kornsn)

Что сделано:
- Настроен сбор метрик докера с помощью [cAdvisor](https://github.com/google/cadvisor)
- Подняты [Grafana](https://grafana.com/) и [AlertManager](https://prometheus.io/docs/alerting/alertmanager/)
- Настроены дашборды для сбора метрик приложения и бизнес метрик
- Настроены алерты на остановку сервисов
- Написан [Makefile](Makefile) для сборки и запуска сервисов
