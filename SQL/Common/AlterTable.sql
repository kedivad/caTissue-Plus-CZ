insert into CATISSUE_USER (IDENTIFIER, ACTIVITY_STATUS, CSM_USER_ID, EMAIL_ADDRESS,LOGIN_NAME,FIRST_NAME,LAST_NAME) values (1,'Active',1,'admin@admin.com','admin@admin.com','Admin','Admin');
insert into CATISSUE_PASSWORD (IDENTIFIER,PASSWORD,UPDATE_DATE,USER_ID) values ( '1','6c416f576765696c6e63316f326d3365',NULL,'1');
ALTER TABLE CATISSUE_PART_MEDICAL_ID ADD constraint MRN_SITE_UNIQUE UNIQUE (MEDICAL_RECORD_NUMBER,SITE_ID);
commit;