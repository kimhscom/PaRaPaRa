--담당자------------------------------------------------------
CREATE TABLE ADMIN(
   ADMIN_ID NUMBER,
   ADMIN_PW VARCHAR2(600) NOT NULL,
   ADMIN_NAME VARCHAR2(50) NOT NULL,
   ADMIN_PHONE VARCHAR2(20) NOT NULL,
   ADMIN_EMAIL VARCHAR2(50) NOT NULL,
   LOC_CODE VARCHAR2(20) NOT NULL,
   AUTH CHAR(1) NOT NULL,
   ADMIN_DELFLAG CHAR(1) NOT NULL,
   CONSTRAINT ADMIN_ID_PK PRIMARY KEY (ADMIN_ID)
);

--업주------------------------------------------------------
CREATE TABLE OWNER(
   OWNER_SEQ NUMBER,
   OWNER_ID VARCHAR2(20) UNIQUE NOT NULL,
   OWNER_PW VARCHAR2(600) NOT NULL,
   OWNER_NAME VARCHAR2(50) NOT NULL,
   OWNER_PHONE VARCHAR2(20) NOT NULL,
   OWNER_EMAIL VARCHAR2(50) NOT NULL,
   AUTH CHAR(1) NOT NULL,
   STORE_CODE VARCHAR2(20) NOT NULL,
   OWNER_START DATE NOT NULL,
   OWNER_END DATE,
   OWNER_MENU VARCHAR2(200),
   ADMIN_ID NUMBER NOT NULL, 
   CONSTRAINT OWNER_SEQ_PK PRIMARY KEY (OWNER_SEQ)
);
CREATE SEQUENCE OWNER_SEQ START WITH 1 INCREMENT BY 1;

--알바------------------------------------------------------
CREATE TABLE ALBA(
   ALBA_SEQ NUMBER,
   ALBA_NAME VARCHAR2(50) NOT NULL,
   ALBA_PHONE VARCHAR2(20) NOT NULL,
   ALBA_ADDRESS VARCHAR2(200) NOT NULL,
   ALBA_TIMESAL NUMBER NOT NULL,
   ALBA_BANK VARCHAR2(50) NOT NULL,
   ALBA_ACCOUNT VARCHAR2(30) NOT NULL,
   ALBA_DELFLAG CHAR(1) NOT NULL,
   ALBA_REGDATE DATE NOT NULL,
   STORE_CODE VARCHAR2(20) NOT NULL,
   CONSTRAINT ALBA_SEQ_PK PRIMARY KEY (ALBA_SEQ)
);
CREATE SEQUENCE ALBA_SEQ START WITH 1 INCREMENT BY 1;
-- OR ALTER TABLE ALBA MODIFY ALBA_BANK VARCHAR2(50);


--주문------------------------------------------------------
CREATE TABLE REQUEST(
   REQUEST_SEQ     NUMBER,
   REQUEST_TIME    DATE NOT NULL,
   REQUEST_MENU    VARCHAR2(100) NOT NULL,
   REQUEST_PRICE   NUMBER   NOT NULL,
   OS_CODE         NUMBER   NOT NULL,
   STORE_CODE       VARCHAR2(20) NOT NULL,
   REQUEST_BANK    VARCHAR2(20) NOT NULL,
   REQUEST_ACCOUNT VARCHAR2(30) NOT NULL,
   CONSTRAINT REQUEST_SEQ_PK PRIMARY KEY (REQUEST_SEQ)
);
CREATE SEQUENCE REQUEST_SEQ START WITH 1 INCREMENT BY 1;

--주문상태------------------------------------------------------
CREATE TABLE ORDER_STATUS(
   OS_CODE NUMBER,
   OS_NAME VARCHAR2(20) NOT NULL,
   CONSTRAINT OS_CODE_PK PRIMARY KEY (OS_CODE)
);

--메뉴------------------------------------------------------
CREATE TABLE MENU(
	MENU_SEQ NUMBER,
	MENU_NAME VARCHAR2(100) NOT NULL,
	MENU_PRICE NUMBER NOT NULL,
	MENU_CATEGORY VARCHAR2(30) NOT NULL,
	MENU_DELFLAG CHAR(1) NOT NULL,
    CONSTRAINT MENU_SEQ_PK PRIMARY KEY (MENU_SEQ)
);
CREATE SEQUENCE MENU_SEQ START WITH 1 INCREMENT BY 1;

-- 근무시간
CREATE TABLE TIMESHEET(
   TS_SEQ NUMBER,
   ALBA_SEQ NUMBER NOT NULL,
   TS_DATE VARCHAR2(30) NOT NULL,
   TS_DATETIME VARCHAR2(50) NOT NULL,
   TS_WORKHOUR NUMBER NOT NULL,
   CONSTRAINT TIMESHEET_PK PRIMARY KEY ("TS_SEQ")
);

CREATE SEQUENCE TS_SEQ INCREMENT BY 1 START WITH 1;

-- 재고
CREATE TABLE STOCK(
   STOCK_SEQ NUMBER,
   STORE_CODE VARCHAR2(20) NOT NULL,
   STOCK_NAME VARCHAR2(100) NOT NULL,
   STOCK_QTY NUMBER NOT NULL,
   CONSTRAINT STOCK_PK PRIMARY KEY ("STOCK_SEQ")
);

CREATE SEQUENCE STOCK_SEQ INCREMENT BY 1 START WITH 1;

-- 매장일정관리
CREATE TABLE CALENDAR(
   CAL_SEQ NUMBER,
   CAL_ID CHAR(1) NOT NULL,
   CAL_TITLE VARCHAR2(100) NOT NULL,
   CAL_CONTENT VARCHAR2(200) NOT NULL,
   CAL_START DATE NOT NULL,
   CAL_END DATE NOT NULL,
   STORE_CODE VARCHAR2(20) NOT NULL,
   CAL_REGDATE DATE NOT NULL,
   CONSTRAINT CALENDAR_PK PRIMARY KEY ("CAL_SEQ")
);

CREATE SEQUENCE CAL_SEQ INCREMENT BY 1 START WITH 1;

-- 공지사항
CREATE TABLE NOTICE(
   NOTICE_SEQ NUMBER,
   NOTICE_TITLE VARCHAR2(200) NOT NULL,
   NOTICE_ID VARCHAR2(50) NOT NULL,
   NOTICE_REGDATE DATE NOT NULL,
   NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
   NOTICE_DELFLAG CHAR(1) NOT NULL,
   CONSTRAINT NOTICE_PK PRIMARY KEY ("NOTICE_SEQ")
);

CREATE SEQUENCE NOTICE_SEQ INCREMENT BY 1 START WITH 1;

-- 공지사항댓글
CREATE TABLE REPLY(
   REPLY_SEQ NUMBER,
   NOTICE_SEQ NUMBER NOT NULL,
   REPLY_ID VARCHAR2(50) NOT NULL,
   REPLY_REGDATE DATE NOT NULL,
   REPLY_CONTENT VARCHAR2(500) NOT NULL,
   CONSTRAINT REPLY_PK PRIMARY KEY ("REPLY_SEQ")
);

CREATE SEQUENCE REPLY_SEQ INCREMENT BY 1 START WITH 1;

-- 매장
CREATE TABLE STORE(
	STORE_CODE VARCHAR2(20) NOT NULL,
	LOC_CODE VARCHAR2(20) NOT NULL,
	STORE_PHONE VARCHAR2(20) NOT NULL,
	STORE_NAME VARCHAR2(100) NOT NULL,
	STORE_ADDRESS VARCHAR2(200) NOT NULL,
	ADMIN_ID NUMBER NOT NULL,
	STORE_DELFLAG CHAR(1) NOT NULL,
	OWNER_REG CHAR(1) DEFAULT '0',
	CONSTRAINT STORE_PK PRIMARY KEY(STORE_CODE)
);

-- 품목
CREATE TABLE ITEM(
	ITEM_SEQ NUMBER,
	ITEM_NAME VARCHAR2(100) NOT NULL,
	ITEM_PRICE NUMBER NOT NULL,
	CONSTRAINT ITEM_SEQ_PK PRIMARY KEY(ITEM_SEQ)
);

-- 발주품목
CREATE TABLE PAO_ITEM(
	PI_SEQ NUMBER,
	ITEM_SEQ NUMBER NOT NULL,
	PI_QTY NUMBER NOT NULL,
	PAO_SEQ NUMBER NOT NULL,
	CONSTRAINT PI_SEQ_PK PRIMARY KEY(PI_SEQ)
);

-- 발주
CREATE TABLE PAO(
	PAO_SEQ NUMBER,
	PAO_DATE DATE NOT NULL,
	PS_CODE NUMBER NOT NULL,
	STORE_CODE VARCHAR2(20) NOT NULL,
	CONSTRAINT PAO_SEQ_PK PRIMARY KEY(PAO_SEQ)
);

-- 발주코드
CREATE TABLE PAO_STATUS(
	PS_CODE NUMBER,
	PS_NAME VARCHAR2(20) NOT NULL,
	CONSTRAINT PS_CODE_PK PRIMARY KEY(PS_CODE)
);

-- 지역
CREATE TABLE LOCATION(
	LOC_CODE VARCHAR2(20),
	LOC_SIDO VARCHAR2(30) NOT NULL,
	LOC_SIGUNGU VARCHAR2(30) NOT NULL,
	CONSTRAINT LOC_CODE_PK PRIMARY KEY(LOC_CODE)
);

-- 채팅 테이블 생성
CREATE TABLE CHAT(
   CHAT_SEQ NUMBER,
   CHAT_TITLE VARCHAR2(110) NOT NULL,
   CHAT_CONTENT VARCHAR2(4000),
   CHAT_SCOUNT NUMBER,
   CHAT_RCOUNT NUMBER,
   CHAT_REGDATE DATE NOT NULL,
   CONSTRAINT CHAT_SEQ_PK PRIMARY KEY (CHAT_SEQ)
);

CREATE SEQUENCE CHAT_SEQ INCREMENT BY 1 START WITH 1

--파일 테이블
CREATE TABLE FILE_LIST(
   FILE_SEQ NUMBER,
   FILE_TNAME VARCHAR2(110) NOT NULL,
   FILE_RNAME VARCHAR2(110) NOT NULL,
   FILE_REGDATE DATE NOT NULL,
   FILE_SIZE NUMBER,
   CHAT_SEQ NUMBER,
   MENU_SEQ NUMBER,
   FILE_AURL VARCHAR2(1000),
   FILE_RURL VARCHAR2(1000),
   CONSTRAINT FILE_SEQ_PK PRIMARY KEY (FILE_SEQ)
);

CREATE SEQUENCE FILE_SEQ INCREMENT BY 1 START WITH 1

-- 임시 파일 테이블
CREATE TABLE TEMP_FILE_LIST(
   FILE_SEQ NUMBER,
   FILE_TNAME VARCHAR2(110) NOT NULL,
   FILE_RNAME VARCHAR2(110) NOT NULL,
   FILE_REGDATE DATE NOT NULL,
   FILE_SIZE NUMBER,
   CHAT_SEQ NUMBER,
   MENU_SEQ NUMBER,
   FILE_AURL VARCHAR2(1000),
   FILE_RURL VARCHAR2(1000),
   CONSTRAINT TEMP_FILE_SEQ_PK PRIMARY KEY (FILE_SEQ)
);

CREATE SEQUENCE TEMP_FILE_SEQ INCREMENT BY 1 START WITH 1;