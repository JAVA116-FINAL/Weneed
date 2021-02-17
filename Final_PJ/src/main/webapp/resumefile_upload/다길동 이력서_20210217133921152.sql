--�ڷ�� ���̺�
select * from DBoard;  

drop table DBoard  cascade constraint;
create table DBoard
(
    no                number        primary key,    --��ȣ
    name         varchar2(20)    not null,            --�̸�    
    pwd              varchar2(20)    not null,            --��й�ȣ
    title             varchar2(100)   not  null,            --����
    email          varchar2(80)    null,            --�̸���
    regdate     date        default  sysdate,    --�ۼ���    
    readcount    number        default 0     null,        --��ȸ��
    content         clob         null,            --����
    groupNo            number          default 0,           --�׷��ȣ
    step           number           default 0,          --���� �ܰ� 
    sortNo         number           default 0,       --���� ���ļ���
    delFlag         char     default 'N',             --���� Flag
    fileName    varchar2(50)     null,                      --���ε����ϸ�
    fileSize    number            default 0,                      --���ϻ����� 
    downCount    number     default 0,            --�ٿ��
    originalFileName    varchar2(50)     null               --������ ���ϸ�	
);

drop sequence DBoard_seq;
create sequence DBoard_seq
increment by 1
start with 1
nocache;

select * from DBoard order by no desc;

��.. 
Ŀ�ؼǸŴ��� ������ 
VO
DAO
Service
PagingVO


���=>(���Ͼ��ε�)
��ȸ=> ����¡, �����̸� �̹����ֱ�,���������� �����̹��� �ֱ�, ���� a��ũ�ɱ�, ��ũ ������ ī��Ʈ
ī��Ʈ=> ���� �ø��� �����Ϸ� �̵�
������=> ���������� ���ϻ��� �����̸� �뷮�����ֱ�, a��ũ �ɾ ��ũ ������ �ٿ�ī��Ʈ �̵�
�ٿ�ī��Ʈ=>�ٿ���� ������Ű��, ���ϴٿ�ε� ��ǲ�ƿ�ǲ ��Ʈ������ ���� �ٿ�ޱ�ó��

����=> title�� �������� �����ְ�,��Ʈ�ѹ� �и����Ͼ����ϰ� �μ�Ʈ
����=> ��й�ȣ üũDao �����ϰ� ������ ������Ʈ dao, ���Ͼ�����Ʈ�ϴ°�� -���������ִ� ��� ���°�� �����ؼ� ó�� ������ ������ �����ϰ� ���ε�  
����=> ��й�ȣ ���Է� �� ���������� �ѹ� �� Ȯ���ϰ� ok���� ����۾�, ���ϻ����ϱ� 
 

 

   