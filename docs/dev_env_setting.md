# 개발 환경 구성

Docker, Docker Compose를 이용하여 Apache HTTPD, PHP, MySQL 개발 및 실행 환경을 구성합니다.

## 준비

* OS에 맞는 [docker, docker-compose 설치](https://docs.docker.com/install/)합니다.
* 이 저장소를 fork 또는 파일을 다운로드합니다.

## MySQL 계정 수정

* [docker-compose.yml](./docker-compose.yml) 파일을 열어 계정과 패스워드를 수정합니다.
* 기본 접속 포트는 `3306`으로 되어 있습니다.
* 기본 접속 포트를 다른 프로그램에서 이미 사용 중인 경우 ports 항목을 수정합니다.
* git에 수정한 계정과 패스워드는 commit하지 않도록 주의합니다.


## 프로젝트 실행과 종료

CLI 환경에서 아래 명령으로 실행 및 종료할 수 있습니다.

프로젝트 실행

```bash
docker-compose up
```

`docker-compose up`을 하게 되면 CLI 상에 다양한 로그가 출력됩니다. 이 상태에서 `Ctrl + C`를 누르면 프로젝트를 멈출 수 있습니다. 

프로젝트 종료

```bash
docker-compose down
```

