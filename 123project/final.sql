--��¥���̺� ����
drop table date_t;
create table date_t (ds varchar2(10) NOT NULL PRIMARY KEY);
--������ �Է�
insert into date_t
SELECT TO_CHAR( TO_DATE('20180101', 'YYYYMMDD') + ROWNUM-1, 'YYYYMMDD') AS DAY
FROM DUAL
CONNECT BY level <= ROUND( TO_DATE('20241231', 'YYYYMMDD') - TO_DATE('20180101', 'YYYYMMDD') );
commit;
drop table hotelchain;
--ȣ��ü�� ����
create table hotelchain(krchainname varchar2(100) NOT NULL PRIMARY KEY, engchainname varchar2(100));
--������ �Է�
insert into hotelchain values('jw�޸���Ʈ','jwmarriotthotel');
insert into hotelchain values('�뺸��','novotelhotel');
insert into hotelchain values('�󸶴�','ramadahotel');
insert into hotelchain values('����','lahanhotel');
insert into hotelchain values('���޸����','lemeridienhotel');
insert into hotelchain values('����Įư','ritzcarltonhotel');
insert into hotelchain values('���ٸ�������Ż','mandarinorientalhotel');
insert into hotelchain values('�޸���Ʈ���ͳ��ų�','marriottinternationalhotel');
insert into hotelchain values('����Ʈ������','bestwesternhotel');
insert into hotelchain values('���ڸ�','accorhotel');
insert into hotelchain values('�������ֽ��丮��','waldorfastoriahotel');
insert into hotelchain values('������Ƽ����','intercontinentalhotel');
insert into hotelchain values('�ھ�','co-ophotel');
insert into hotelchain values('�ܷ���','conradhotel');
insert into hotelchain values('������','fourseasonshotel');
insert into hotelchain values('��ư','hiltonhotel');
insert into hotelchain values('�Ե�','lottehotel');
insert into hotelchain values('����Ű��','benikeahotel');
insert into hotelchain values('�Ŷ�ȣ��','shillahotel');
insert into hotelchain values('��ũ�Ͼ�Ʈ','parkhyatthotel');

--(����)�װ��� �Է�
drop table airline;
create table airline(airname varchar2(100) NOT NULL PRIMARY KEY);
--������ �Է�
insert into airline values('�����װ�');
insert into airline values('�ƽþƳ��װ�');
insert into airline values('Ƽ�����װ�');
insert into airline values('������');
insert into airline values('�����');
insert into airline values('����λ�');
insert into airline values('�����װ�');
insert into airline values('�̽�Ÿ�װ�');
insert into airline values('�ö��̰���');
insert into airline values('����������װ�');

--(����)���� �Է�
drop table airport;
create table airport(portname varchar2(100) NOT NULL PRIMARY KEY);
--������ �Է�
insert into airport values('������������');
insert into airport values('���ر�������');
insert into airport values('���ֱ�������');
insert into airport values('�뱸��������');
insert into airport values('û�ֱ�������');
insert into airport values('���ȱ�������');
insert into airport values('��õ��������');

--���ҵ�Ͽ�û�Ҷ������ �ӽ����̺��
DROP TABLE PERIOD_TEMP CASCADE CONSTRAINTS;
DROP TABLE ADDITIONAL_FEE_TEMP CASCADE CONSTRAINTS;
DROP TABLE ACCOMMODATIONS_TEMP CASCADE CONSTRAINTS;
DROP TABLE ROOM_INFO_TEMP CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ACCOMMODATIONS_temp;
DROP SEQUENCE SEQ_ADDITIONAL_FEE_temp;
DROP SEQUENCE SEQ_PERIOD_temp;
DROP SEQUENCE SEQ_ROOM_INFO_temp;
CREATE SEQUENCE SEQ_ACCOMMODATIONS_temp;
CREATE SEQUENCE SEQ_ADDITIONAL_FEE_temp;
CREATE SEQUENCE SEQ_PERIOD_temp;
CREATE SEQUENCE SEQ_ROOM_INFO_temp;
-- ����
CREATE TABLE ACCOMMODATIONS_TEMP
(
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	-- ī�װ�
	ACATE VARCHAR2(100),
	-- ���ھ��Ҹ�
	ANAME VARCHAR2(200),
	-- �ּ�
	AADDRESS VARCHAR2(200),
	-- ��ȭ��ȣ
	APHONE VARCHAR2(30),
	-- x��ǥ
	AXCOORDI VARCHAR2(30),
	-- y��ǥ
	AYCOORDI VARCHAR2(30),
	-- �Ѱ��Ǽ�
	ATOTALROOM NUMBER(5),
	-- ���Ҽ���
	AGRADE VARCHAR2(20),
	-- ��ǥ�Ұ�
	ADETAIL VARCHAR2(2000),
	-- ��ǥ�̹���
	AMAINIMG VARCHAR2(3000),
	-- �����
	AREGDATE DATE,
	-- �������� : ������ ��� = Y �� ǥ��
	-- 
	AISDEL VARCHAR2(1),
	PRIMARY KEY (AID)
);


-- �߰����
CREATE TABLE ADDITIONAL_FEE_TEMP
(
	-- �߰������̵�
	AFID NUMBER(4) NOT NULL,
	-- �ο��߰����
	AFPERSONNEL NUMBER(10),
	-- �����߰����
	AFBREAKFAST NUMBER(10),
	-- ħ���߰����
	AFBED NUMBER(10),
	-- ���Ǿ��̵�
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (AFID)
);
-- �Ⱓ
CREATE TABLE PERIOD_TEMP
(
	-- �Ⱓ���̵�
	PEID NUMBER(4) NOT NULL,
	-- ���� : �����/������/�ؼ�����
	PESEASON VARCHAR2(20),
	-- ���۳�¥
	PESTART DATE,
	-- ����¥
	PEEND DATE,
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (PEID)
);
-- ���Ǽ�������
CREATE TABLE ROOM_INFO_TEMP
(
	-- ���Ǿ��̵�
	RIID NUMBER(4) NOT NULL,
	-- �������� : (ȣ��-~��,���-00ȣ)
	RIROOMTYPE VARCHAR2(100),
	-- �� ���Ǽ�
	RIROOM NUMBER(4),
	-- �ΰ����� : ���ͳ�,����,����,��
	RISERVICE VARCHAR2(3000),
	-- ����ũ�� : 7��
	RISIZE VARCHAR2(50),
	-- ���ڰ����ο�
	RIMINPER NUMBER(3),
	-- �����ִ��ο�
	RIMAXPER NUMBER(3),
	-- ������ 1�� �⺻���
	RIPEAK NUMBER(10),
	-- �ؼ����� 1�� �⺻���
	RISEMIPEAK NUMBER(10),
	-- ����� 1�� �⺻���
	RIOFF NUMBER(10),
	-- ��ǥ�̹���
	RIMAINIMG VARCHAR2(3000),
	-- �߰��̹���1
	RIEXTRAIMG1 VARCHAR2(3000),
	-- �߰��̹���2
	RIEXTRAIMG2 VARCHAR2(3000),
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (RIID)
);


/* Drop Tables */

DROP TABLE PERIOD CASCADE CONSTRAINTS;
DROP TABLE ADDITIONAL_FEE CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE ROOM_INFO CASCADE CONSTRAINTS;
DROP TABLE ACCOMMODATIONS CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE HEAD_ADMIN CASCADE CONSTRAINTS;
DROP TABLE USERQNA CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE CHAT_ADD CASCADE CONSTRAINTS;
DROP TABLE CHAT_BUDDY CASCADE CONSTRAINTS;
DROP TABLE CHAT_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOMJOIN CASCADE CONSTRAINTS;
DROP TABLE CHAT_MEMBERS CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOM CASCADE CONSTRAINTS;

/* drop sequence */
DROP SEQUENCE SEQ_ACCOMMODATIONS;
DROP SEQUENCE SEQ_ADDITIONAL_FEE;
DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_COMMENTS;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE SEQ_FAVORITE;
DROP SEQUENCE SEQ_HEAD_ADMIN;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_PAYMENT;
DROP SEQUENCE SEQ_PERIOD;
DROP SEQUENCE SEQ_RESERVATION;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_ROOM_INFO;
DROP SEQUENCE SEQ_USERQNA;
DROP SEQUENCE SEQ_CHAT_ADD ;
DROP SEQUENCE SEQ_CHAT_BUDDY ;
DROP SEQUENCE SEQ_CHAT_MESSAGE ;
DROP SEQUENCE SEQ_CHAT_ROOMJOIN ;
DROP SEQUENCE SEQ_CHAT_ROOM ;

/* Create sequence. */
CREATE SEQUENCE SEQ_ACCOMMODATIONS;
CREATE SEQUENCE SEQ_ADDITIONAL_FEE;
CREATE SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_COMMENTS;
CREATE SEQUENCE SEQ_FAQ;
CREATE SEQUENCE SEQ_FAVORITE;
CREATE SEQUENCE SEQ_HEAD_ADMIN;
CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_PAYMENT;
CREATE SEQUENCE SEQ_PERIOD;
CREATE SEQUENCE SEQ_RESERVATION;
CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_ROOM_INFO;
CREATE SEQUENCE SEQ_USERQNA;
CREATE SEQUENCE SEQ_CHAT_ADD ;
CREATE SEQUENCE SEQ_CHAT_BUDDY ;
CREATE SEQUENCE SEQ_CHAT_MESSAGE ;
CREATE SEQUENCE SEQ_CHAT_ROOMJOIN ;
CREATE SEQUENCE SEQ_CHAT_ROOM ;



/* Create Tables */
-- ģ���߰����
CREATE TABLE CHAT_ADD
(
	-- �߰���Ͼ��̵�
	CAID NUMBER(4) NOT NULL,
	-- ����������ξ��̵�
	CAADDID VARCHAR2(100),
	-- ���̵�
	CMID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CAID)
);


-- ä��ģ�����
CREATE TABLE CHAT_BUDDY
(
	-- ģ����Ͼ��̵�
	CBID NUMBER(4) NOT NULL,
	-- ģ�����̵�
	CBBUID VARCHAR2(100),
	-- ���̵�
	CMID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CBID)
);


-- ä��ȸ��
CREATE TABLE CHAT_MEMBERS
(
	-- ���̵�
	CMID VARCHAR2(100) NOT NULL,
	-- �̸�
	CMNAME VARCHAR2(100),
	-- �������
	CMBIRTH DATE,
	-- �����ʻ���
	CMPROFILE VARCHAR2(3000),
	-- ��ȭ��
	CMSCNAME VARCHAR2(100),
	-- Ż�𿩺�
	CMDROP VARCHAR2(1),
	PRIMARY KEY (CMID)
);

insert into chat_members values('unknown','�˼�����',null,'noimage2.jpg',null,null);
commit;


-- ä�ø޼���
CREATE TABLE CHAT_MESSAGE
(
	-- �޼������̵�
	MSGID NUMBER(4) NOT NULL,
	-- �޼�������
	MSGMESSAGE VARCHAR2(1000),
	-- �޼����ð�
	MSGTIME DATE,
    -- �ý��۸޼���
    MSGSYSMSG VARCHAR2(1000),
	-- ���̵�
	CMID VARCHAR2(100) NOT NULL,
	-- ä�ù���̵�
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (MSGID)
);


-- ä�ù�
CREATE TABLE CHAT_ROOM
(
	-- ä�ù���̵�
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (CRID)
);


-- ä�ù濬��
CREATE TABLE CHAT_ROOMJOIN
(
	-- ������̵�
	JOINID NUMBER(4) NOT NULL,
	-- ���������ӽð�
	JOINCONTIME DATE,
	-- ���̵�
	CMID VARCHAR2(100) NOT NULL,
	-- ä�ù���̵�
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (JOINID)
);
-- ����
select * from ACCOMMODATIONS_TEMP;
select * from ACCOMMODATIONS;
desc ACCOMMODATIONS_TEMP;

UPDATE ACCOMMODATIONS_TEMP SET AREGDATE = '2021/02/02' WHERE acate = 'ȣ��';
CREATE TABLE ACCOMMODATIONS

(
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	-- ī�װ�
	ACATE VARCHAR2(100),
	-- ���ھ��Ҹ�
	ANAME VARCHAR2(200),
	-- �ּ�
	AADDRESS VARCHAR2(200),
	-- ��ȭ��ȣ
	APHONE VARCHAR2(30),
	-- x��ǥ
	AXCOORDI VARCHAR2(30),
	-- y��ǥ
	AYCOORDI VARCHAR2(30),
	-- �Ѱ��Ǽ�
	ATOTALROOM NUMBER(5),
	-- ���Ҽ���
	AGRADE VARCHAR2(20),
	-- ��ǥ�Ұ�
	ADETAIL VARCHAR2(2000),
	-- ��ǥ�̹���
	AMAINIMG VARCHAR2(3000),
	-- �����
	AREGDATE DATE,
	-- �������� : ������ ��� = Y �� ǥ��
	-- 
	AISDEL VARCHAR2(1),
	PRIMARY KEY (AID)
);


-- �߰����
CREATE TABLE ADDITIONAL_FEE
(
	-- �߰������̵�
	AFID NUMBER(4) NOT NULL,
	-- �ο��߰����
	AFPERSONNEL NUMBER(10),
	-- �����߰����
	AFBREAKFAST NUMBER(10),
	-- ħ���߰����
	AFBED NUMBER(10),
	-- ���Ǿ��̵�
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (AFID)
);


-- �Խ���
CREATE TABLE BOARD
(
	-- �Խ��Ǿ��̵�
	BID NUMBER(4) NOT NULL,
	-- ī�װ�
	BCATE VARCHAR2(50),
	-- ����
	BTITLE VARCHAR2(100),
	-- ����
	BCONTENT VARCHAR2(3000),
	-- �ۼ���
	BRDATE DATE,
	-- ÷������1
	BFILE1 VARCHAR2(4000),
	-- ÷������2
	BFILE2 VARCHAR2(4000),
	-- ÷������3
	BFILE3 VARCHAR2(4000),
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (BID)
);


-- ���
CREATE TABLE COMMENTS
(
	-- ��۾��̵�
	CID NUMBER(4) NOT NULL,
	-- ����
	CCONTENT NVARCHAR2(1000),
	-- �ۼ���
	CRDATE DATE,
	-- �׷��ȣ
	CREF NUMBER(3),
	-- ��¼���
	CSTEP NUMBER(3),
	-- ��۹�ȣ : (����Ǵ��)���°�������
	-- 
	CLEV NUMBER(1),
	-- �������� : ���� ->Y
	CISDEL VARCHAR2(1),
	-- �Խ��Ǿ��̵�
	BID NUMBER(4) NOT NULL,
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CID)
);


-- ���� ���� ����
CREATE TABLE FAQ
(
	-- ���ֹ����������̵�
	FID NUMBER(4) NOT NULL,
	-- ����
	FTITLE VARCHAR2(100),
	-- ����
	FCONTENT VARCHAR2(4000),
	-- ÷������
	FFILE VARCHAR2(4000),
	-- �����
	FRDATE DATE,
	-- �������� : ���� ->Y
	-- �����->N
	-- 
	FPUBLIC VARCHAR2(1),
	-- ���ξ��̵�
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (FID)
);


-- ���ã��
CREATE TABLE FAVORITE
(
	-- ���ã����̵�
	FAVID NUMBER(4) NOT NULL,
	-- ��ȣ�ϴ� ����
	FAVAIRPORT VARCHAR2(100),
	-- ��ȣ�ϴ��װ���
	FAVAIRLINE VARCHAR2(100),
	-- ��ȣȣ��ü��
	FAVHOTEL VARCHAR2(100),
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (FAVID)
);


-- ������
CREATE TABLE HEAD_ADMIN
(
	-- ���ξ��̵�
	AID VARCHAR2(10) NOT NULL,
	-- ��й�ȣ
	APW VARCHAR2(100),
	-- �̸�
	ANAME VARCHAR2(100),
	-- �����
	ARDATE DATE,
	PRIMARY KEY (AID)
);

select * from MEMBERS;
-- ȸ��
CREATE TABLE MEMBERS
(
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	-- ��й�ȣ
	MPW VARCHAR2(15),
	-- �̸�
	MNAME VARCHAR2(100),
	-- ��ȭ��ȣ
	MPHONE VARCHAR2(300),
	-- �̸���
	MEMAIL VARCHAR2(25),
	-- ������ : DATE DEFAULT SYSDATE
	MRDATE DATE,
	-- �������
	MBIRTH DATE,
	-- �����ʻ���
	MPROFILE VARCHAR2(3000),
	-- Ż�𿩺� : Ż�� -> Y
	MDROP VARCHAR2(1),
	PRIMARY KEY (MID)
);


-- ������
CREATE TABLE NOTICE
(
	-- ���ֹ����������̵�
	NID NUMBER(4) NOT NULL,
	-- ����
	NTITLE VARCHAR2(100),
	-- ����
	NCONTENT VARCHAR2(4000),
	-- ÷������
	NFILE VARCHAR2(4000),
	-- ����� : DATE DEFAULT SYSDATE
	NRDATE DATE,
	-- �������� : ����->Y
	-- �����->N
	-- 
	NPUBLIC VARCHAR2(1),
	-- ���ξ��̵�
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (NID)
);


-- ����
CREATE TABLE PAYMENT
(
	-- �������̵�
	PID NUMBER(4) NOT NULL,
	-- ��������
	PMETHOD VARCHAR2(100),
	-- ������¥
	PDATE DATE,
	-- �� ���
	PTOTAL NUMBER(10),
	-- ȯ�� : ȯ�� �� Y
	PREFUND VARCHAR2(1),
	-- ������ū
	PTOKEN VARCHAR2(100),
	-- ������̵�
	RID NUMBER(4) NOT NULL,
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (PID)
);


-- �Ⱓ
CREATE TABLE PERIOD
(
	-- �Ⱓ���̵�
	PEID NUMBER(4) NOT NULL,
	-- ���� : �����/������/�ؼ�����
	PESEASON VARCHAR2(20),
	-- ���۳�¥
	PESTART DATE,
	-- ����¥
	PEEND DATE,
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (PEID)
);


-- ����
CREATE TABLE RESERVATION
(
	-- ������̵�
	RID NUMBER(4) NOT NULL,
	-- ���ǿ����ȣ
	RORDERNUM NUMBER(3),
	-- �ο�
	RAMOUNT NUMBER(3),
	-- �� ����
	RROOMNUM NUMBER(3),
	-- ���������
	RCHECKIN VARCHAR2(15),
	-- ���������� : ���������
	RCHECKOUT VARCHAR2(15),
	-- �������̸�
	RRESNAME VARCHAR2(300),
	-- ��������ȭ��ȣ
	RRESPHONE VARCHAR2(300),
	-- ������ �̸���
	RRESEMAIL VARCHAR2(300),
	-- �����߰��ο� : 0 -> �����߰�����
	-- 1~ -> �� ���� �߰�
	-- 
	REXBREAKNUM NUMBER(1),
	-- ħ���߰� : 1���߰� ->1
	REXBED NUMBER(1),
	-- �ο��߰� : 0->�߰�����
	-- 1~->�� �߰�
	REXPERSON NUMBER(1),
	-- ��ҿ��� : ���->Y
	-- 
	RCANCEL VARCHAR2(5),
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	-- ���Ǿ��̵�
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (RID)
);


-- ����
CREATE TABLE REVIEW
(
	-- ������̵�
	REID NUMBER(4) NOT NULL,
	-- ��������
	RETITLE VARCHAR2(300),
	-- ���䳻��
	RECONTENT VARCHAR2(4000),
	-- �������
	REPHOTO VARCHAR2(4000),
	-- �������� : DATE DEFAULT SYSDATE
	RERDATE DATE,
	-- ����
	RESTAR NUMBER(3),
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	-- ������̵�
	RID NUMBER(4) NOT NULL,
	PRIMARY KEY (REID)
);


-- ���Ǽ�������
CREATE TABLE ROOM_INFO
(
	-- ���Ǿ��̵�
	RIID NUMBER(4) NOT NULL,
	-- �������� : (ȣ��-~��,���-00ȣ)
	RIROOMTYPE VARCHAR2(100),
	-- �� ���Ǽ�
	RIROOM NUMBER(4),
	-- �ΰ����� : ���ͳ�,����,����,��
	RISERVICE VARCHAR2(3000),
	-- ����ũ�� : 7��
	RISIZE VARCHAR2(50),
	-- ���ڰ����ο�
	RIMINPER NUMBER(3),
	-- �����ִ��ο�
	RIMAXPER NUMBER(3),
	-- ������ 1�� �⺻���
	RIPEAK NUMBER(10),
	-- �ؼ����� 1�� �⺻���
	RISEMIPEAK NUMBER(10),
	-- ����� 1�� �⺻���
	RIOFF NUMBER(10),
	-- ��ǥ�̹���
	RIMAINIMG VARCHAR2(3000),
	-- �߰��̹���1
	RIEXTRAIMG1 VARCHAR2(3000),
	-- �߰��̹���2
	RIEXTRAIMG2 VARCHAR2(3000),
	-- ���Ҿ��̵�
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (RIID)
);


-- ���Ǳ�
CREATE TABLE USERQNA
(
	-- ���Ǳ۾��̵�
	QID NUMBER(4) NOT NULL,
	-- ���Ǳ�ī�װ� : 1.��ǰ 2.��ȯ/ȯ�� 3.����Ʈ�̿� 4.��Ÿ
	QCATE VARCHAR2(20),
	-- ���Ǳۺ��
	QPW VARCHAR2(100),
	-- ���Ǳ�����
	QTITLE VARCHAR2(300),
	-- ���Ǳ۳���
	QCONTENT VARCHAR2(4000),
	-- ���Ǳ�÷��
	QFILE VARCHAR2(4000),
	-- ���Ǳ۵���� : DATE DEFAULT SYSDATE
	QRDATE DATE,
	-- ���Ǳ�ó������ : ó��->Y
	QLEV VARCHAR2(1),
	-- �׷��ȣ
	QREF NUMBER(3),
	-- �۹�ȣ
	QSTEP NUMBER(3),
	-- ���̵�
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (QID)
);



/* Create Foreign Keys */

ALTER TABLE PERIOD
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE ROOM_INFO
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (BID)
	REFERENCES BOARD (BID)
;


ALTER TABLE CHAT_ADD
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_BUDDY
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_ROOMJOIN
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (CRID)
	REFERENCES CHAT_ROOM (CRID)
;


ALTER TABLE CHAT_ROOMJOIN
	ADD FOREIGN KEY (CRID)
	REFERENCES CHAT_ROOM (CRID)
;


ALTER TABLE FAQ
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE USERQNA
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE ADDITIONAL_FEE
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;




--sql�ʱ⼼��