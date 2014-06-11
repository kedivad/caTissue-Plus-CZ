/** This table is to support WUSTL Key migration */
CREATE TABLE CSM_MIGRATE_USER
(
 LOGIN_NAME varchar2(100 Byte) NOT NULL,
 TARGET_IDP_NAME varchar2(100 Byte),
 WUSTLKEY varchar2(100 Byte) default NULL UNIQUE,
 MIGRATION_STATUS varchar2(100 Byte) NOT NULL,
 primary key (LOGIN_NAME)
);

/*Added for removing the unhooked record added in catissue V1.1.2 deployment.*/
delete from DYEXTN_ABSTRACT_RECORD_ENTRY where identifier not in
(
select identifier from catissue_participant_rec_ntry
union
select identifier from catissue_scg_rec_ntry
union
select identifier from catissue_specimen_rec_ntry sre
);