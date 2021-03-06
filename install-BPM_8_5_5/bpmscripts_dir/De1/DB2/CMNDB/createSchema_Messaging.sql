-- BEGIN COPYRIGHT
-- *************************************************************************
-- 
--  Licensed Materials - Property of IBM
--  5725-C94, 5725-C95, 5725-C96
--  (C) Copyright IBM Corporation 2013. All Rights Reserved.
--  US Government Users Restricted Rights- Use, duplication or disclosure
--  restricted by GSA ADP Schedule Contract with IBM Corp.
-- 
-- *************************************************************************
-- END COPYRIGHT


CREATE TABLE db2admin.SIBOWNER (
  ME_UUID VARCHAR(16),
  INC_UUID VARCHAR(16),
  VERSION INTEGER,
  MIGRATION_VERSION INTEGER,
  ME_LUTS TIMESTAMP,
  ME_INFO VARCHAR(254),
  ME_STATUS VARCHAR(16)
)
;

CREATE TABLE db2admin.SIBOWNERO (
   EMPTY_COLUMN INTEGER
)
;

CREATE TABLE db2admin.SIBCLASSMAP (
  CLASSID INTEGER NOT NULL,
  URI VARCHAR(2048) NOT NULL,
  PRIMARY KEY(CLASSID)
)
;

CREATE TABLE db2admin.SIBLISTING (
  ID INTEGER NOT NULL,
  SCHEMA_NAME VARCHAR(10),
  TABLE_NAME VARCHAR(10) NOT NULL,
  TABLE_TYPE CHAR(1) NOT NULL,
  PRIMARY KEY(ID)
)
;

CREATE TABLE db2admin.SIB000 (
  ID BIGINT NOT NULL,
  STREAM_ID BIGINT NOT NULL,
  TYPE CHAR(2),
  EXPIRY_TIME BIGINT,
  STRATEGY INTEGER,
  REFERENCE BIGINT,
  CLASS_ID INTEGER NOT NULL,
  PRIORITY INTEGER,
  SEQUENCE BIGINT,
  PERMANENT_ID INTEGER,
  TEMPORARY_ID INTEGER,
  LOCK_ID BIGINT,
  DATA_SIZE INTEGER NOT NULL,
  DATA VARCHAR(3360) FOR BIT DATA,
  LONG_DATA BLOB(1G),
  XID VARCHAR(254),
  DELETED SMALLINT,
  REDELIVERED_COUNT INTEGER NOT NULL WITH DEFAULT 0,
  PRIMARY KEY(ID)
)
;

CREATE INDEX db2admin.SIB000STREAMIX ON
db2admin.SIB000(STREAM_ID,SEQUENCE) ALLOW REVERSE SCANS
;

ALTER TABLE db2admin.SIB000 VOLATILE CARDINALITY
;

CREATE TABLE db2admin.SIB001 (
  ID BIGINT NOT NULL,
  STREAM_ID BIGINT NOT NULL,
  TYPE CHAR(2),
  EXPIRY_TIME BIGINT,
  STRATEGY INTEGER,
  REFERENCE BIGINT,
  CLASS_ID INTEGER NOT NULL,
  PRIORITY INTEGER,
  SEQUENCE BIGINT,
  PERMANENT_ID INTEGER,
  TEMPORARY_ID INTEGER,
  LOCK_ID BIGINT,
  DATA_SIZE INTEGER NOT NULL,
  DATA VARCHAR(3360) FOR BIT DATA,
  LONG_DATA BLOB(1G),
  XID VARCHAR(254),
  DELETED SMALLINT,
  REDELIVERED_COUNT INTEGER NOT NULL WITH DEFAULT 0,
  PRIMARY KEY(ID)
)
;

CREATE INDEX db2admin.SIB001STREAMIX ON
db2admin.SIB001(STREAM_ID,SEQUENCE) ALLOW REVERSE SCANS
;

ALTER TABLE db2admin.SIB001 VOLATILE CARDINALITY
;

CREATE TABLE db2admin.SIB002 (
  ID BIGINT NOT NULL,
  STREAM_ID BIGINT NOT NULL,
  TYPE CHAR(2),
  EXPIRY_TIME BIGINT,
  STRATEGY INTEGER,
  REFERENCE BIGINT,
  CLASS_ID INTEGER NOT NULL,
  PRIORITY INTEGER,
  SEQUENCE BIGINT,
  PERMANENT_ID INTEGER,
  TEMPORARY_ID INTEGER,
  LOCK_ID BIGINT,
  DATA_SIZE INTEGER NOT NULL,
  DATA VARCHAR(3360) FOR BIT DATA,
  LONG_DATA BLOB(1G),
  XID VARCHAR(254),
  DELETED SMALLINT,
  REDELIVERED_COUNT INTEGER NOT NULL WITH DEFAULT 0,
  PRIMARY KEY(ID)
)
;

CREATE INDEX db2admin.SIB002STREAMIX ON
db2admin.SIB002(STREAM_ID,SEQUENCE) ALLOW REVERSE SCANS
;

ALTER TABLE db2admin.SIB002 VOLATILE CARDINALITY
;

CREATE TABLE db2admin.SIBXACTS (
  XID VARCHAR(254) NOT NULL,
  STATE CHAR(1) NOT NULL,
  PRIMARY KEY(XID)
)
;

CREATE TABLE db2admin.SIBKEYS (
  ID VARCHAR(50) NOT NULL,
  LAST_KEY BIGINT NOT NULL,
  PRIMARY KEY(ID)
)
;
