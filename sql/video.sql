--tb_videotype����Ƶ���ͱ�
create table tb_videotype(
       typeid number(10) primary key, --typeid��sequence��ţ�
       typename varchar2(100)         --typename1���������ƣ�
);
--��������seq_typeid
create sequence seq_typeid
start with 1 increment by 1
minvalue 1 maxvalue 999999999
nocycle cache 20;

--tb_video����Ƶ��Ϣ��
create table tb_video(
       videoid number(10) primary key,--videoid(sequence���)
       videoname varchar2(200),   --videoname�����ƣ�
       author varchar2(100) ,  --author�����ߣ�
       imgurl varchar2(4000),   --img������·����
       fileurl varchar2(4000),    --videofile����Ƶ·����
       filesize varchar2(10),   --filesize����Ƶ��С��
       format varchar2(20),   --format����Ƶ��ʽ��
       play number(10),       --play����������
       collection number(10),  --collection���ղ�����
       uptime varchar2(100),   --uptime���ϴ�ʱ�䣩
       typeid number(10)   --typeid����Ƶ����,�����
);
alter table tb_video
add (videolength varchar2(30) );  --videolength����Ƶ���ȣ�

alter table tb_video
modify (videolength varchar2(100) default sysdate);

--��������seq_videoid
create sequence seq_videoid
start with 1 increment by 1 
minvalue 1 maxvalue 999999999 
nocycle cache 20;
--typeid����Ƶ����,�����
alter table tb_video 
      add constraint fk_typeid foreign key(typeid)
      references tb_videotype(typeid);

--tb_user���û���Ϣ��
create table tb_user(
       userid varchar2(20) primary key,--userid���û��˺ţ�
       password varchar2(20),   --password�����룩
       username varchar2(20) ,  --,username���ǳƣ�
       imgurl varchar2(4000),   --img��ͷ��
       sex varchar2(10),    --sex���Ա�
       birthday varchar2(10),   --birthday�����գ�,
       address varchar2(20),   --address����ַ��
       emotion varchar2(20),       --emotion������״����
       email varchar2(50),  --email�����䣩,
       sign varchar2(200)   --sign������ǩ����
);
alter table tb_user
add (registertime varchar2(30)  );   --registertime��ע��ʱ�䣩
alter table tb_user
modify (registertime varchar2(100) default sysdate);

--tb_admin(����Ա)
create table tb_admin(
       adminid varchar2(20) primary key, --adminid(����Ա�˺�)
       password varchar2(20)   --password�����룩
);

--tb_usercollection���û��ղر�
create table tb_usercollection(
      userid varchar2(20), --userid���û��˺�,���)
      collection varchar2(4000) --collection���ղ��б�
);
--userid���û��˺�,���)
alter table tb_usercollection
      add constraint fk_collectionid foreign key(userid)
      references tb_user(userid);
      
--tb_videocomment����Ƶ���۱�
create table tb_videocomment(
      commentid number(10) primary key,--(sequence���)
      videoid number(10), --����Ƶ��ţ������
      userid varchar2(20), --userid���û��˺�,���)
      content varchar2(200),--content���������ݣ�
      commenttime varchar2(100)  --commenttime����ʱ��
);
alter table tb_videocomment
modify (commenttime varchar2(100) default sysdate);
--(sequence���)
create sequence seq_commentid
start with 1 increment by 1
minvalue 1 maxvalue 999999999
nocycle cache 20;
--����Ƶ��ţ������
alter table tb_videocomment
      add constraint fk_comment_videoid foreign key(videoid)
      references tb_video(videoid);
--userid���û��˺�,���)
alter table tb_videocomment
      add constraint fk_comment_userid foreign key(userid)
      references tb_user(userid);
--tb_submissionͶ���
create table tb_submission(
       submissionid number(10) primary key,--(sequence���)
       userid varchar2(20), --userid���û��˺�,���)
       videoname varchar2(200),   --videoname�����ƣ�
       imgurl varchar2(4000),   --img������·����
       fileurl varchar2(4000),    --videofile����Ƶ·����
       filesize varchar2(10),   --filesize����Ƶ��С��
       format varchar2(20),   --format����Ƶ��ʽ��
       submissiontime varchar2(100), --submissiontime��Ͷ��ʱ�䣩
       state varchar2(10) --state��״̬��
);
alter table tb_submission
modify (submissiontime varchar2(100) default sysdate);
--(sequence���)
create sequence seq_submissionid
start with 1 increment by 1
minvalue 1 maxvalue 999999999
nocycle cache 20;
--userid���û��˺�,���)
alter table tb_submission
       add constraint fk_submission_userid foreign key(userid) 
       references tb_user(userid);       
--tb_barrage��Ļ��
create table tb_barrage(
      barrageid number(10) primary key,--(sequence���)
      videoid number(10), --����Ƶ��ţ������
      userid varchar2(20), --userid���û��˺�,���)
      content varchar2(200),--content����Ļ���ݣ�
      videotime varchar2(100),  --videotime����Ƶ���ʱ�䣩
      barragetime varchar2(100)  -- barragetime������Ļ�����ڣ�
);
alter table tb_barrage
modify (barragetime varchar2(100) default sysdate);
--(sequence���)
create sequence seq_barrageid
start with 1 increment by 1
minvalue 1 maxvalue 999999999
nocycle cache 20;
--����Ƶ��ţ������
alter table tb_barrage
      add constraint fk_barrage_videoid foreign key(videoid)
      references tb_video(videoid);
--userid���û��˺�,���)
alter table tb_barrage
      add constraint fk_barrage_userid foreign key(userid)
      references tb_user(userid);
  








