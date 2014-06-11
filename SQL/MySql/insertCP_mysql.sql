/****** Inserts generic collection protocol required for caTIES   *******/
insert into CATISSUE_SPECIMEN_PROTOCOL select max(identifier)+1,1,'@@COLL_PROT_TITLE@@','generic collection protocol','','2007-02-16',NULL,NULL,'','Active' from CATISSUE_SPECIMEN_PROTOCOL;

insert into CATISSUE_COLLECTION_PROTOCOL values((select identifier from CATISSUE_COLLECTION_PROTOCOL where title='@@COLL_PROT_TITLE@@'),'',0,0);

insert into CATISSUE_COLL_PROT_EVENT select max(identifier)+1,'Nová diagnóza','TestGCP',1,(select identifier from catissue_specimen_protocol where title='@@COLL_PROT_TITLE@@') from CATISSUE_COLL_PROT_EVENT;

insert into CATISSUE_QUANTITY select max(identifier)+1,0 from CATISSUE_QUANTITY;

insert into CATISSUE_SPECIMEN_REQUIREMENT select max(identifier)+1,'Tkáň','Fixní Tkáň','Abdomen, NOS', 'Maligní',(select max(identifier) from catissue_quantity) from CATISSUE_SPECIMEN_REQUIREMENT;

insert CATISSUE_COLL_SPECIMEN_REQ values ((select max(identifier) from catissue_coll_prot_event) , (select max(identifier) from CATISSUE_SPECIMEN_REQUIREMENT));