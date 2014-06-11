/** This table is to support WUSTL Key migration */
CREATE TABLE CSM_MIGRATE_USER
(
 LOGIN_NAME varchar2(100 Byte) NOT NULL,
 TARGET_IDP_NAME varchar2(100 Byte),
 WUSTLKEY varchar2(100 Byte) default NULL,
 MIGRATION_STATUS varchar2(100 Byte) NOT NULL,
 primary key (LOGIN_NAME)
);