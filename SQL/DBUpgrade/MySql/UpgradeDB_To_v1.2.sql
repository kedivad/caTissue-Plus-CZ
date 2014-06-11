 /*Added for IDP in catissue V1.2*/


DROP TABLE IF EXISTS `CSM_MIGRATE_USER`;

CREATE TABLE `CSM_MIGRATE_USER` (
  `LOGIN_NAME` varchar(100) NOT NULL,
  `TARGET_IDP_NAME` varchar(100) default NULL,
  `WUSTLKEY` varchar(100) default NULL,
  `MIGRATION_STATUS` varchar(100) default NULL,
  PRIMARY KEY  (`LOGIN_NAME`)
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