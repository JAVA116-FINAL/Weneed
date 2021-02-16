--자료실 테이블
select * from DBoard;  

drop table DBoard  cascade constraint;
create table DBoard
(
    no                number        primary key,    --번호
    name         varchar2(20)    not null,            --이름    
    pwd              varchar2(20)    not null,            --비밀번호
    title             varchar2(100)   not  null,            --제목
    email          varchar2(80)    null,            --이메일
    regdate     date        default  sysdate,    --작성일    
    readcount    number        default 0     null,        --조회수
    content         clob         null,            --내용
    groupNo            number          default 0,           --그룹번호
    step           number           default 0,          --글의 단계 
    sortNo         number           default 0,       --글의 정렬순서
    delFlag         char     default 'N',             --삭제 Flag
    fileName    varchar2(50)     null,                      --업로드파일명
    fileSize    number            default 0,                      --파일사이즈 
    downCount    number     default 0,            --다운수
    originalFileName    varchar2(50)     null               --변경전 파일명	
);

drop sequence DBoard_seq;
create sequence DBoard_seq
increment by 1
start with 1
nocache;

select * from DBoard order by no desc;

음.. 
커넥션매니저 만들어보기 
VO
DAO
Service
PagingVO


등록=>(파일업로드)
조회=> 페이징, 리플이면 이미지넣기,파일있으면 파일이미지 넣기, 제목에 a링크걸기, 링크 누르면 카운트
카운트=> 숫자 올리고 디테일로 이동
디테일=> 파일있으면 디스켓사진 파일이름 용량보여주기, a링크 걸어서 링크 누르면 다운카운트 이동
다운카운트=>다운숫자 증가시키고, 파일다운로드 인풋아웃풋 스트림으로 파일 다운받기처리

리플=> title에 원글제목 보여주고,솔트넘버 밀리게하업뎃하고 인서트
수정=> 비밀번호 체크Dao 실행하고 맞으면 업데이트 dao, 파일업데이트하는경우 -원래파일있는 경우 없는경우 구분해서 처리 있으면 원래것 삭제하고 업로드  
삭제=> 비밀번호 폼입력 후 제이쿼리로 한번 더 확인하고 ok에서 디비작업, 파일삭제하기 
 

 

   