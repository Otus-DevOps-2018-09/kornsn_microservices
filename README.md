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
