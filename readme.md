# Codeigniter를 이용한 Restful API 개발(TEST)

## 개요

서비스를 사용하는 회원 데이터에 대한 CRUD(Create, Read, Update, Delete)를 처리하는 **API**

* **회원 데이터 생성(회원 가입) API**
* **회원 데이터 수정 API**
* **회원 데이터 삭제 API**
* **하나의 회원 데이터 출력 API**
* **여러 회원 데이터 출력(페이지를 나눠 출력) API**

## 개발환경

* Apache HTTPD
* PHP
* Codeigniter
* MySQL
* Git
* Docker
* Docker Compose

## API 명세
### 회원 가입
#### 입력
| HTTP method | URI                                      | Explanation   |
| ----------- | ---------------------------------------- | ------------- |
| POST        | /members                                 | email : 이메일 <br />password : 비밀번호<br />password_re : 비밀번호 확인<br />name : 이름<br />tel : 전화번호<br />rcmd_code : 추천인코드<br />marketing: 마켓팅동의 (Y,N)      |
#### 출력
| depth1| depth2                                      | Explanation   |
| ----------- | --------------------------------------| ------------- |
| data        |                                       | 목록 |
|             | idx                                   | 고유번호 |
|             | email                                   | 이메일 |
|             | name                                   | 이름 |
|             | tel                                   | 전화 |
|             | rcmd_code                                   | 추천코드 |
|             | marketing                                   | 마켓팅동의 |
| code        |                                       | 상태코드: 200,404 |
| message        |                                       | 상태메세지 |

### 회원 수정
#### 입력
| HTTP method | URI                                      | Explanation   |
| ----------- | ---------------------------------------- | ------------- |
| PUT         | /members/{idx}                           | idx : 고유번호<br />password : 비밀번호<br />password_re : 비밀번호 확인<br />marketing: 마켓팅동의 (Y,N)<br />      |
#### 출력
| depth1| depth2                                      | Explanation   |
| ----------- | --------------------------------------| ------------- |
| validationMessage        |                                       | 검증 메세지 |
| code        |                                       | 상태코드: 200,404 |
| message        |                                       | 상태메세지 |

### 회원 삭제
#### 입력
| HTTP method | URI                                      | Explanation   |
| ----------- | ---------------------------------------- | ------------- |
| DELETE      | /members/{idx}                           | idx : 고유번호      |
#### 출력
| depth1| depth2                                      | Explanation   |
| ----------- | --------------------------------------| ------------- |
| code        |                                       | 상태코드: 200,404 |
| message        |                                       | 상태메세지 |


### 회원 상세
#### 입력
| HTTP method | URI                                      | Explanation   |
| ----------- | ---------------------------------------- | ------------- |
| GET         | /members/{idx}                           | idx : 고유번호      |
#### 출력
| depth1| depth2                                      | Explanation   |
| ----------- | --------------------------------------| ------------- |
| data        |                                       | 목록 |
|             | idx                                   | 고유번호 |
|             | email                                   | 이메일 |
|             | password                                   | 비밀번호 |
|             | name                                   | 이름 |
|             | tel                                   | 전화 |
|             | rcmd_code                                   | 추천코드 |
|             | marketing                                   | 마켓팅동의 |
| code        |                                       | 상태코드: 200,204 |
| message        |                                       | 상태메세지 |
### 회원 목록
#### 입력
| HTTP method | URI                                      | Explanation   |
| ----------- | ---------------------------------------- | ------------- |
| GET         | /members?query={"page":"1","perpage":"10"}   |page:페이지번호<br />perpage:항목개수    |
#### 출력
| depth1| depth2                                      | Explanation   |
| ----------- | --------------------------------------| ------------- |
| data        |                                       | 목록 |
|             | idx                                   | 고유번호 |
|             | email                                   | 이메일 |
|             | password                                   | 비밀번호 |
|             | name                                   | 이름 |
|             | tel                                   | 전화 |
|             | rcmd_code                                   | 추천코드 |
|             | marketing                                   | 마켓팅동의 |
| code        |                                       | 상태코드: 200,204 |
| message        |                                       | 상태메세지 |
