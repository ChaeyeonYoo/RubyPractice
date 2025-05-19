# RubyPractice

이 프로젝트는 Ruby on Rails를 사용한 개인 홈페이지입니다.

## 설치 방법

1. Ruby와 Rails가 설치되어 있어야 합니다.
   - Ruby 버전: 3.3.0
   - Rails 버전: 8.0.2

2. 프로젝트 클론하기:
```bash
git clone https://github.com/ChaeyeonYoo/RubyPractice.git
cd RubyPractice
```

3. 의존성 설치:
```bash
bundle install
```

4. 데이터베이스 설정:
```bash
rails db:create
rails db:migrate
```

5. 서버 실행:
```bash
./bin/dev
```

6. 웹 브라우저에서 접속:
   - http://localhost:3000 으로 접속하시면 됩니다.

## 주요 기능

- 홈페이지 메인 화면
- 포트폴리오 페이지
- 프로젝트 소개
- 연락처 정보

## 기술 스택

- Ruby on Rails
- PostgreSQL
- Tailwind CSS
- Hotwire (Turbo & Stimulus)
