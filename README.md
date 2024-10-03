# README

### 안녕하세요 2024 동의대학교 김성희 교수님이 Ruby On Rails 강의에 사용한 코드와 명령어입니다.


## 사용환경
* 구름 IDE
* OS: Ubuntu 18.04 LTS
* DBMS: postgresql

## 명령어

### 1) 운영체제 설정 명령어
```bash
sudo apt-get update && sudo apt-get install -y libpq-dev
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add –
curl -fsSL https://cli-assets.heroku.com/apt/release.key | sudo apt-key add –
wget -qO - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add –
sudo apt-get update
```


### 2) postgresql 설정 명령어
```bash
sudo apt install postgresql postgresql-contrib
#(중간 중간 입력, 이 명령어만 칠것 !)
sudo service postgresql start
#(postgresql 콘솔창 실행)
sudo -u postgres psql 
#(백슬레시 + q) -> psql 해제 명령어
\q 
```


### 3) scaffold 생성 명령어

```
# 1:N Scaffold 생성시 블로그 Scaffold 생성
rails generate scaffold article title:string content:text 

# 1:N Scaffold 생성 시 댓글 Scaffold 생성
rails generate scaffold comment comment:string article:references 

# 생성한 Scaffold 확장 & 테이블 생성
rake db:migrate

```


### 5) Gemfile
   
**gemfile 수정 후 반드시 저장 후 "bundle install" 터미널에 입력 (파일 이름 옆 *확인!!)**



### 6) .gitignore 에 작성할 내용 (제목은 무조건 ".gitignore")

```
# node_modules 폴더 전체 제외
node_modules/
# 민감한 정보가 담긴 PEM 키 파일 제외
*.pem
# 추가로 Rails 프로젝트에서 자주 제외되는 파일들
/log/*
/tmp/*
/coverage/*
/db/*.sqlite3
/db/*.sqlite3-journal
/public/assets
.byebug_history
.bundle
/config/master.key
/config/credentials.yml.enc
# IDE 관련 파일 제외 (선택 사항)
.idea/
.vscode/
```


### 7) devise 터미널 명령어만

```
rails generate devise:install
rails generate devise:views
#user라는 이름 가진 devise model 생성
rails generate devise user
# 생성한 devise user model 확장 (테이블 생성)
rake db:migrate
```


### 8) Git 명령어 
처음 연결

```
git config --global user.name "닉네임"
git config --global user.email 이메일 
git init
git add .
git commit -m "메모 내용 입력"
git remote add origin 주소(연결하고 싶은 repository url)
git branch -M main
git push origin main
```

**이후 username 과 password 입력 시, password에는 git token 입력 !!!!**



연결된 상태 (add -> commit -> push) 순서 지켜야함!!
```
git add .
git commit -m "메모 내용 입력"
git push origin main
```

협업 시 (상대 repository에서 시작해야 할 때)
```
git pull origin main
```


현재 연결되어 있는 git 확인
```
git remote -v
```


현재 git 상태 확인 (git 명령어가 어디까지 작성했는지 확인하기 위해서)
```
git status
```


branch(브랜치) 명령어 (분기 관리)
```
# branch 목록 조회
git branch  

# branch 생성
git branch <새 branch 이름>  

# branch 삭제
git branch -d <삭제할 branch 이름>  

# branch 전환
git checkout <전환할 branch 이름>  

# 해당 branch 에 push
git push origin <branch 이름>  


```
