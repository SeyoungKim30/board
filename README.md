# board

## 대표기능
- 회원 가입, 로그인
- 글 작성, 수정, 삭제
- 연관 게시물
## 사용기술
#### Language & Framework
- JAVA
- SPRING
- MyBatis
- HTML
- Javascript
#### DB & Server
- Oracle
- Apache Tomecat
#### API & Library
- Fetch
- [Komoran](https://docs.komoran.kr/index.html)
- Bootstrap

## ERD
<img width="70%" src="https://user-images.githubusercontent.com/112458754/236673597-a90ad9c0-b23b-40f0-80ca-17ea3108557e.png">


## 기능 설명
<img width="60%" src="https://github.com/SeyoungKim30/board/assets/112458754/973728f9-db42-4359-b0bc-d9491d885436">


#### 연관게시물
- 게시글을 등록할때 형태소 분석을 통해 대명사, 고유명사, 외국어 분류 [✔코드 확인](https://github.com/SeyoungKim30/board/blob/80702110ad80a16239dc70baac21225005a0b84c/src/main/java/board/service/Komo.java#L14)
- 게시글 id, 분류된 단어, 해당 글에 나온 횟수가 DB에 저장
- 게시글 조회 시 연관 게시물 검색[✔코드확인](https://github.com/SeyoungKim30/board/blob/6589d57d8be503eb49633094d0089e280205965b/src/main/java/resource/mapper/board_mapper.xml#L56)
- 전체 게시글 중 해당 단어가 사용된 글이 40% 이하일 때, 연관 게시물을 파악하는 단어로 사용 
- 연관단어가 2개 이상 나타난 글이 연관 게시글로 검색
- 연관단어가 많을수록, 자주 언급될 수록 연관도가 높은 글로 평가

#### 게시글, 코멘트 작성
- 회원만 작성 가능
- 본인이 작성한 글만 수정, 삭제 가능
- 코멘트 등록, 삭제 fetch

#### 게시글 목록 탐색
- 글 제목으로 검색 가능 [✔코드확인](https://github.com/SeyoungKim30/board/blob/6589d57d8be503eb49633094d0089e280205965b/src/main/java/resource/mapper/board_mapper.xml#L7)
- 한페이지에 30개의 게시글 표시
- 최대 5개의 페이지인덱스 표시

## 사용설명
1. board\src\main\java\resource\a00_config 에서 Database를 설정할 수 있습니다.
2. Scripts\Script.sql 파일을 실행합니다.
