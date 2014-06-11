#------ Create unique key for catissue_related_tables_map and catissue_search_display_data----
#-- Remove duplicate entries first
alter table CATISSUE_SEARCH_DISPLAY_DATA add column DEFAULT_VIEW_ATTRIBUTE bit default 0;
delete from CATISSUE_RELATED_TABLES_MAP where FIRST_TABLE_ID=38 and SECOND_TABLE_ID=19;
alter table CATISSUE_RELATED_TABLES_MAP add constraint RELATED_TABLES_KEY unique (FIRST_TABLE_ID,SECOND_TABLE_ID);
alter table CATISSUE_SEARCH_DISPLAY_DATA add constraint SEARCH_DATA_KEY unique (RELATIONSHIP_ID,COL_ID);

# ------ 'Death date' and 'Vital status' attribute addition to Participant table ------
# ---------- 23 May 2006 -------------
ALTER TABLE CATISSUE_PARTICIPANT ADD COLUMN DEATH_DATE DATE;
ALTER TABLE CATISSUE_PARTICIPANT ADD COLUMN VITAL_STATUS varchar(50);

#-- Participant related data model changes
#--alter table CATISSUE_RACE drop foreign key FKB0242ECD87E5ADC7;
#--drop table if exists CATISSUE_RACE;
create table CATISSUE_RACE (
   PARTICIPANT_ID bigint not null,
   RACE_NAME varchar(50)
);
#--alter table CATISSUE_PARTICIPANT Engine = INNODB;
alter table CATISSUE_RACE add index FKB0242ECD87E5ADC7 (PARTICIPANT_ID), add constraint FKB0242ECD87E5ADC7 foreign key (PARTICIPANT_ID) references CATISSUE_PARTICIPANT (IDENTIFIER);

insert into catissue_race(participant_id,race_name) (select identifier,race from CATISSUE_PARTICIPANT);

alter table CATISSUE_PARTICIPANT drop column race;

# ----- VitalStatus Constant and Permissible value ----- 
INSERT INTO CATISSUE_CDE VALUES ( '2004001','VitalStatus','Vital status of the participant.',1.0,null);
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2638,'Mrtev',NULL,'2004001');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2639,'Živý',NULL,'2004001');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2640,'Neznámo',NULL,'2004001');

#-- user paasword changes 
#--alter table CATISSUE_PASSWORD drop foreign key FKDE1F38972206F20F;
#--drop table if exists CATISSUE_PASSWORD;

create table CATISSUE_PASSWORD (
  IDENTIFIER bigint not null auto_increment,
   PASSWORD varchar(50),
   UPDATE_DATE date,
   USER_ID bigint,
   primary key (IDENTIFIER)
);
#--alter table catissue_user Engine = INNODB;

alter table CATISSUE_PASSWORD add index FKDE1F38972206F20F (USER_ID), add constraint FKDE1F38972206F20F foreign key (USER_ID) references CATISSUE_USER (IDENTIFIER);

insert into catissue_password (IDENTIFIER,PASSWORD,UPDATE_DATE,USER_ID) (select identifier, password,now(),identifier from catissue_user);

alter table catissue_user drop column password;


#-- user  password chnages finish

#--------- changes in database for new model of Storage Container
#--drop table if exists CATISSUE_STOR_TYPE_SPEC_CLASS;
#--drop table if exists CATISSUE_STOR_TYPE_HOLDS_TYPE;
#--drop table if exists CATISSUE_ST_CONT_COLL_PROT_REL;
#--drop table if exists CATISSUE_STOR_CONT_SPEC_CLASS;
#--drop table if exists CATISSUE_STOR_CONT_STOR_TYPE_REL;
drop table if exists CATISSUE_STORAGE_CONT_DETAILS;
alter table CATISSUE_STORAGE_CONTAINER add column CONTAINER_NAME varchar(100) not null;
#--------Adding container_name in storage_container table
#--alter table CATISSUE_CONTAINER add column CONTAINER_NAME varchar (100) NOT NULL;

#--------Give values same as identifier to container_name for previouly added containers.

#--------drop the container_number column
alter table CATISSUE_STORAGE_CONTAINER drop column CONTAINER_NUMBER;

alter table CATISSUE_STORAGE_TYPE add column ACTIVITY_STATUS varchar(30) default NULL;
#-------- set default Activity status to 'Active ' for all storage types
update CATISSUE_STORAGE_TYPE set ACTIVITY_STATUS='Active' where type!='Any';

#-------- copying first row of storage types to temp table and addind "Any" entry and adding first row to the last identifier
drop table if exists catissue_temp_type;


CREATE TABLE catissue_temp_type (                                                                                                      
                         `IDENTIFIER` bigint(20),                                                                                          
                         `TYPE` varchar(50),                                                                                                   
                         `DEFAULT_TEMP_IN_CENTIGRADE` double,                                                                                         
                         `ONE_DIMENSION_LABEL` varchar(50),                                                                                           
                         `TWO_DIMENSION_LABEL` varchar(50),                                                                                           
                         `STORAGE_CONTAINER_CAPACITY_ID` bigint(20),                                                                                  
                         `ACTIVITY_STATUS` varchar(30)
                       );
                                                                                              
insert into catissue_temp_type (select * from catissue_storage_type where identifier=1 and type!='Any');
update catissue_temp_type set identifier=(select max(identifier)+1 from catissue_storage_type);
update catissue_storage_type set type='Any',activity_status='Disabled' where identifier=1;
insert into catissue_storage_type (select * from catissue_temp_type);
update catissue_storage_container set storage_type_id=(select identifier from catissue_temp_type) where storage_type_id=1;

#-- insert into catissue_storage_type (type,activity_status,identifier) values ('Any','Disabled',1);

drop table catissue_temp_type;
#----------Chnages finish



rename table catissue_storage_cont_capacity to CATISSUE_CAPACITY;


#--alter table CATISSUE_CONTAINER_TYPE drop foreign key FKCBBC9954DAC76C0;
#--drop table if exists CATISSUE_CONTAINER_TYPE;

#-- Creating table catissue_container_type
create table CATISSUE_CONTAINER_TYPE (
   IDENTIFIER bigint not null auto_increment,
   CAPACITY_ID bigint ,
   NAME varchar(100),
   ONE_DIMENSION_LABEL varchar(100),
   TWO_DIMENSION_LABEL varchar(100),
   COMMENTS text,
   primary key (IDENTIFIER)
   );
#-- alter table CATISSUE_CONTAINER_TYPE change column COMMENT COMMENTS text;
#-- altering table catissue_storage_type
#--alter table catissue_capacity Engine = INNODB;
alter table CATISSUE_CONTAINER_TYPE add index FKCBBC9954DAC76C0 (CAPACITY_ID);
alter table CATISSUE_CONTAINER_TYPE add constraint FKCBBC9954DAC76C0 foreign key (CAPACITY_ID) references CATISSUE_CAPACITY (IDENTIFIER);

insert into catissue_container_type(Identifier,capacity_id,name,one_dimension_label,two_dimension_label) (select identifier,storage_container_capacity_id,type,one_dimension_label,two_dimension_label from catissue_storage_type);

alter table CATISSUE_STORAGE_TYPE drop foreign key FKE9A0629A5F7CB0FE ;
alter table catissue_storage_type drop column type;
alter table catissue_storage_type drop column one_dimension_label;
alter table catissue_storage_type drop column two_dimension_label;
alter table catissue_storage_type drop column storage_container_capacity_id;
alter table catissue_storage_type change DEFAULT_TEMP_IN_CENTIGRADE DEFAULT_TEMPERATURE double null; 


#--create rel table for type and speicmen class entries
create table CATISSUE_STOR_TYPE_SPEC_CLASS (
   STORAGE_TYPE_ID bigint not null,
   SPECIMEN_CLASS varchar(50),
   SPECIMEN_CLASS_ID bigint	
);

#-- create rel table for type and type relation
create table CATISSUE_STOR_TYPE_HOLDS_TYPE (
   STORAGE_TYPE_ID BIGINT not null,
   HOLDS_STORAGE_TYPE_ID BIGINT not null,
   primary key (STORAGE_TYPE_ID, HOLDS_STORAGE_TYPE_ID)
);

#-- adding foreign key constraints
#--alter table catissue_storage_type Engine = INNODB;
alter table CATISSUE_STOR_TYPE_HOLDS_TYPE add index (STORAGE_TYPE_ID), add constraint FK185C50B59A3CE5C foreign key (STORAGE_TYPE_ID) references CATISSUE_STORAGE_TYPE (IDENTIFIER);
alter table CATISSUE_STOR_TYPE_HOLDS_TYPE add index (HOLDS_STORAGE_TYPE_ID), add constraint FK185C50B81236791 foreign key (HOLDS_STORAGE_TYPE_ID) references CATISSUE_STORAGE_TYPE (IDENTIFIER);
alter table CATISSUE_STOR_TYPE_SPEC_CLASS add index FK1BCF33BA59A3CE5C (STORAGE_TYPE_ID), add constraint FK1BCF33BA59A3CE5C foreign key (STORAGE_TYPE_ID) references CATISSUE_STORAGE_TYPE (IDENTIFIER);

update `csm_protection_element` set `PROTECTION_ELEMENT_ID`='44',`PROTECTION_ELEMENT_NAME`='Capacity',`PROTECTION_ELEMENT_DESCRIPTION`='Capacity Class',`OBJECT_ID`='edu.wustl.catissuecore.domain.Capacity',`ATTRIBUTE`=NULL,`PROTECTION_ELEMENT_TYPE_ID`=NULL,`APPLICATION_ID`='1',`UPDATE_DATE`='0000-00-00' where `PROTECTION_ELEMENT_ID`='44';

 

#--alter table CATISSUE_CONTAINER drop foreign key FK49B8DE5DB097B2E;
#--alter table CATISSUE_CONTAINER drop foreign key FK49B8DE5DAC76C0;
#--drop table if exists CATISSUE_CONTAINER;;
create table CATISSUE_CONTAINER (
   IDENTIFIER bigint not null auto_increment,
   ACTIVITY_STATUS varchar(20),
   BARCODE varchar(100),
   CAPACITY_ID bigint,
   PARENT_CONTAINER_ID bigint,
   COMMENTS text,
   CONT_FULL bit,
   NAME varchar(100),
   POSITION_DIMENSION_ONE integer,
   POSITION_DIMENSION_TWO integer,
   primary key (IDENTIFIER)
);
#-- alter table CATISSUE_CONTAINER change column COMMENT COMMENTS text;
#--update catissue_storage_container set container_name = identifier;
insert into CATISSUE_CONTAINER(IDENTIFIER,ACTIVITY_STATUS,BARCODE,CAPACITY_ID,PARENT_CONTAINER_ID,CONT_FULL,NAME,POSITION_DIMENSION_ONE,POSITION_DIMENSION_TWO) (SELECT IDENTIFIER,ACTIVITY_STATUS,BARCODE,STORAGE_CONTAINER_CAPACITY_ID,PARENT_CONTAINER_ID,IS_CONTAINER_FULL,CONTAINER_NAME,POSITION_DIMENSION_ONE,POSITION_DIMENSION_TWO FROM CATISSUE_STORAGE_CONTAINER);

alter table CATISSUE_CONTAINER add index FK49B8DE5DB097B2E (PARENT_CONTAINER_ID), add constraint FK49B8DE5DB097B2E foreign key (PARENT_CONTAINER_ID) references CATISSUE_CONTAINER (IDENTIFIER);
alter table CATISSUE_CONTAINER add index FK49B8DE5DAC76C0 (CAPACITY_ID), add constraint FK49B8DE5DAC76C0 foreign key (CAPACITY_ID) references CATISSUE_CAPACITY (IDENTIFIER);


#--insert into catissue_container (IDENTIFIER,ACTIVITY_STATUS,CAPACITY_ID,CONT_FULL,NAME)values(1,'Active',2,0,'aa');
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP foreign key FK28429D015F7CB0FE;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP foreign key FK28429D01DB097B2E;

ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN IS_CONTAINER_FULL;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN ACTIVITY_STATUS;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN BARCODE;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN PARENT_CONTAINER_ID;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN STORAGE_CONTAINER_CAPACITY_ID;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN POSITION_DIMENSION_ONE;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN POSITION_DIMENSION_TWO;
ALTER TABLE CATISSUE_STORAGE_CONTAINER DROP COLUMN CONTAINER_NAME;
ALTER TABLE CATISSUE_STORAGE_CONTAINER add index FK28429D01BC7298A9 (IDENTIFIER), add constraint FK28429D01BC7298A9 foreign key (IDENTIFIER) references CATISSUE_CONTAINER (IDENTIFIER);


create table CATISSUE_ST_CONT_COLL_PROT_REL (
   STORAGE_CONTAINER_ID bigint not null,
   COLLECTION_PROTOCOL_ID bigint not null,
   primary key (STORAGE_CONTAINER_ID, COLLECTION_PROTOCOL_ID)
);

#--alter table CATISSUE_STORAGE_CONTAINER Engine = INNODB;
#--alter table CATISSUE_COLLECTION_PROTOCOL Engine = INNODB;

alter table CATISSUE_ST_CONT_COLL_PROT_REL add index FK3AE9FCA7B3DFB11D (STORAGE_CONTAINER_ID), add constraint FK3AE9FCA7B3DFB11D foreign key (STORAGE_CONTAINER_ID) references CATISSUE_STORAGE_CONTAINER (IDENTIFIER);
alter table CATISSUE_ST_CONT_COLL_PROT_REL add index FK3AE9FCA748304401 (COLLECTION_PROTOCOL_ID), add constraint FK3AE9FCA748304401 foreign key (COLLECTION_PROTOCOL_ID) references CATISSUE_COLLECTION_PROTOCOL (IDENTIFIER);

#-- rename table CATISSUE_STORAGE_CONT_COLL_PROT_REL to CATISSUE_ST_CONT_COLL_PROT_REL;
#-- drop table if exists CATISSUE_STORAGE_CONT_COLL_PROT_REL;


create table CATISSUE_STOR_CONT_SPEC_CLASS (
   STORAGE_CONTAINER_ID bigint not null,
   SPECIMEN_CLASS varchar(50),
   SPECIMEN_CLASS_ID bigint	
);

alter table CATISSUE_STOR_CONT_SPEC_CLASS add index FKE7F5E8C2B3DFB11D (STORAGE_CONTAINER_ID), add constraint FKE7F5E8C2B3DFB11D foreign key (STORAGE_CONTAINER_ID) references CATISSUE_STORAGE_CONTAINER (IDENTIFIER);

create table CATISSUE_ST_CONT_ST_TYPE_REL (
   STORAGE_CONTAINER_ID bigint not null,
   STORAGE_TYPE_ID bigint not null,
   primary key (STORAGE_CONTAINER_ID, STORAGE_TYPE_ID)
);
alter table CATISSUE_ST_CONT_ST_TYPE_REL add index FK703B902159A3CE5C (STORAGE_TYPE_ID), add constraint FK703B902159A3CE5C foreign key (STORAGE_TYPE_ID) references CATISSUE_STORAGE_TYPE (IDENTIFIER);
alter table CATISSUE_ST_CONT_ST_TYPE_REL add index FK703B9021B3DFB11D (STORAGE_CONTAINER_ID), add constraint FK703B9021B3DFB11D foreign key (STORAGE_CONTAINER_ID) references CATISSUE_STORAGE_CONTAINER (IDENTIFIER);

#-- rename table CATISSUE_STOR_CONT_STOR_TYPE_REL to CATISSUE_ST_CONT_ST_TYPE_REL;
#-- drop table if exists CATISSUE_STOR_CONT_STOR_TYPE_REL;

update `csm_protection_element` set `PROTECTION_ELEMENT_ID`='184',`PROTECTION_ELEMENT_NAME`='Capacity_systemIdentifier',`PROTECTION_ELEMENT_DESCRIPTION`='Capacity systemIdentifier attribute',`OBJECT_ID`='edu.wustl.catissuecore.domain.Capacity',`ATTRIBUTE`='systemIdentifier',`PROTECTION_ELEMENT_TYPE_ID`=NULL,`APPLICATION_ID`='1',`UPDATE_DATE`='0000-00-00' where `PROTECTION_ELEMENT_ID`='184';
update `csm_protection_element` set `PROTECTION_ELEMENT_ID`='185',`PROTECTION_ELEMENT_NAME`='Capacity_oneDimensionCapacity',`PROTECTION_ELEMENT_DESCRIPTION`='Capacity oneDimensionCapacity attribute',`OBJECT_ID`='edu.wustl.catissuecore.domain.Capacity',`ATTRIBUTE`='oneDimensionCapacity',`PROTECTION_ELEMENT_TYPE_ID`=NULL,`APPLICATION_ID`='1',`UPDATE_DATE`='0000-00-00' where `PROTECTION_ELEMENT_ID`='185';
update `csm_protection_element` set `PROTECTION_ELEMENT_ID`='186',`PROTECTION_ELEMENT_NAME`='Capacity_twoDimensionCapacity',`PROTECTION_ELEMENT_DESCRIPTION`='Capacity twoDimensionCapacity attribute',`OBJECT_ID`='edu.wustl.catissuecore.domain.Capacity',`ATTRIBUTE`='twoDimensionCapacity',`PROTECTION_ELEMENT_TYPE_ID`=NULL,`APPLICATION_ID`='1',`UPDATE_DATE`='0000-00-00' where `PROTECTION_ELEMENT_ID`='186';



#-- changes finish for storage type and storage container



#-----Start---Bug 2088: changes done on:19\07\2006--------

#--------Adding Specimen Collection Group Name in CATISSUE_SPECIMEN_COLL_GROUP table
alter table CATISSUE_SPECIMEN_COLL_GROUP add column NAME varchar(50) NOT NULL;


#--------Give values to group_name for previouly added specimen collection groups.
update CATISSUE_SPECIMEN_COLL_GROUP set NAME=IDENTIFIER where NAME='';
alter table CATISSUE_SPECIMEN_COLL_GROUP add constraint NAME unique (NAME);
alter table CATISSUE_SPECIMEN_COLL_GROUP change column NAME NAME varchar(55);
#-----End---Bug 2088: changes done on:19\07\2006--------

#-- poornima's file
#--Changes in Specimen Requirement table 
create table CATISSUE_QUANTITY (
   IDENTIFIER bigint not null auto_increment,
   QUANTITY double precision,
   primary key (IDENTIFIER)
);

insert into catissue_quantity(identifier,quantity) (select identifier,quantity from catissue_specimen_requirement);

alter table catissue_specimen_requirement drop column QUANTITY,add column QUANTITY_ID bigint (20);   

alter table catissue_specimen_requirement add foreign key (QUANTITY_ID) references catissue_quantity (IDENTIFIER) on delete cascade on update cascade ;

update catissue_specimen_requirement set quantity_id = identifier;
#-- insert into catissue_specimen_requirement(quantity_id) (select identifier from catissue_quantity);

#-- Changes for Specimen Array functionality
create table CATISSUE_SPECIMEN_ARRAY (
   IDENTIFIER bigint not null,
   CREATED_BY_ID bigint,
   SPECIMEN_ARRAY_TYPE_ID bigint,
   STORAGE_CONTAINER_ID bigint,
   DISTRIBUTION_ID bigint,
   primary key (IDENTIFIER)
);
create table CATISSUE_SPECIMEN_ARRAY_TYPE (
   IDENTIFIER bigint not null,
   SPECIMEN_CLASS varchar(50),
   primary key (IDENTIFIER)
);

create table CATISSUE_SPECI_ARRAY_CONTENT (
   IDENTIFIER bigint not null auto_increment,
   CONC_IN_MICROGM_PER_MICROLTR double precision,
   INITIAL_QUANTITY_ID bigint,
   POSITION_DIMENSION_ONE integer,
   POSITION_DIMENSION_TWO integer,
   SPECIMEN_ID bigint,
   SPECIMEN_ARRAY_ID bigint,
   primary key (IDENTIFIER)
);


create table CATISSUE_SPECIMEN_TYPE (
   SPECIMEN_ARRAY_TYPE_ID bigint not null,
   SPECIMEN_TYPE varchar(50)
);



alter table CATISSUE_SPECI_ARRAY_CONTENT add index FKBEA9D458C4A3C438 (SPECIMEN_ARRAY_ID), add constraint FKBEA9D458C4A3C438 foreign key (SPECIMEN_ARRAY_ID) references CATISSUE_SPECIMEN_ARRAY (IDENTIFIER);
#--alter table CATISSUE_SPECIMEN Engine = INNODB;
alter table CATISSUE_SPECI_ARRAY_CONTENT add index FKBEA9D45860773DB2 (SPECIMEN_ID), add constraint FKBEA9D45860773DB2 foreign key (SPECIMEN_ID) references CATISSUE_SPECIMEN (IDENTIFIER);
alter table CATISSUE_SPECI_ARRAY_CONTENT add index FKBEA9D45892AB74B4 (INITIAL_QUANTITY_ID), add constraint FKBEA9D45892AB74B4 foreign key (INITIAL_QUANTITY_ID) references CATISSUE_QUANTITY (IDENTIFIER);
alter table CATISSUE_SPECIMEN_ARRAY add index FKECBF8B3E64B129CC (CREATED_BY_ID), add constraint FKECBF8B3E64B129CC foreign key (CREATED_BY_ID) references CATISSUE_USER (IDENTIFIER);
#--alter table CATISSUE_DISTRIBUTION Engine = INNODB;
alter table CATISSUE_SPECIMEN_ARRAY add index FKECBF8B3EF8278B6 (DISTRIBUTION_ID), add constraint FKECBF8B3EF8278B6 foreign key (DISTRIBUTION_ID) references CATISSUE_DISTRIBUTION (IDENTIFIER);
alter table CATISSUE_SPECIMEN_ARRAY add index FKECBF8B3EBC7298A9 (IDENTIFIER), add constraint FKECBF8B3EBC7298A9 foreign key (IDENTIFIER) references CATISSUE_CONTAINER (IDENTIFIER);
alter table CATISSUE_SPECIMEN_ARRAY add index FKECBF8B3EB3DFB11D (STORAGE_CONTAINER_ID), add constraint FKECBF8B3EB3DFB11D foreign key (STORAGE_CONTAINER_ID) references CATISSUE_STORAGE_CONTAINER (IDENTIFIER);
alter table CATISSUE_SPECIMEN_ARRAY add index FKECBF8B3EECE89343 (SPECIMEN_ARRAY_TYPE_ID), add constraint FKECBF8B3EECE89343 foreign key (SPECIMEN_ARRAY_TYPE_ID) references CATISSUE_SPECIMEN_ARRAY_TYPE (IDENTIFIER);
alter table CATISSUE_SPECIMEN_ARRAY_TYPE add index FKD36E0B9BBC7298A9 (IDENTIFIER), add constraint FKD36E0B9BBC7298A9 foreign key (IDENTIFIER) references CATISSUE_CONTAINER_TYPE (IDENTIFIER);
alter table CATISSUE_SPECIMEN_TYPE add index FKFF69C195ECE89343 (SPECIMEN_ARRAY_TYPE_ID), add constraint FKFF69C195ECE89343 foreign key (SPECIMEN_ARRAY_TYPE_ID) references CATISSUE_SPECIMEN_ARRAY_TYPE (IDENTIFIER);
#-- poornima's file end



# ------ CSM update for Similar Containers Action --------
# ------ chetan 04-07-2006 ---------
# ------ Note: The values which are used for Identifiers like PG_PE_ID, PROTECTION_ELEMENT_ID, should be replaced by appropriate values (Max(Indetifier)+1) by doing a
# ------ Select Max(<Indetifier>) from <corresponding-table>. It is assumed that "17" is the Identifier for PROTECTION_GROUP "Adminstrative".

#---- Chnages by Ashwin to take max() id first clean the table.
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SimilarContainersAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.SimilarContainersAction','edu.wustl.catissuecore.action.SimilarContainersAction','edu.wustl.catissuecore.action.SimilarContainersAction',NULL,NULL,1,'2006-07-04');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,17,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SimilarContainersAction'),'0000-00-00');



#--------------- bug 2058 need Male  and Female values instead of Male gender and Female gender
update catissue_permissible_value set value='Male' where identifier=59;
update catissue_permissible_value set value='Female' where identifier=61;
#-------- finish

#------- Aniruddha : Changes for specimen aliquoting
ALTER TABLE CATISSUE_SPECIMEN ADD COLUMN LABEL varchar(50);
update CATISSUE_SPECIMEN set label=identifier where label is null;
alter table CATISSUE_SPECIMEN add constraint Label unique (LABEL);
ALTER TABLE CATISSUE_SPECIMEN ADD COLUMN LINEAGE varchar(50);
ALTER TABLE CATISSUE_SPECIMEN ADD COLUMN PATHOLOGICAL_STATUS varchar(50);

ALTER TABLE CATISSUE_SPECIMEN_CHAR drop column PATHOLOGICAL_STATUS;



#------Start:- Jitendra: Bug-1678 -------

alter table catissue_reported_problem modify MESSAGE_BODY varchar(500) NOT NULL;
alter table CATISSUE_AUDIT_EVENT_DETAILS modify CURRENT_VALUE varchar(500);


#------End: Jitendra: Bug-1678 -------

#--- Start: update by Ashwin
#--- Delete first duplicate entries
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayTypeAction';
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.domain.SpecimenArrayType';
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType';

INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'edu.wustl.catissuecore.action.SpecimenArrayTypeAction','edu.wustl.catissuecore.action.SpecimenArrayTypeAction','edu.wustl.catissuecore.action.SpecimenArrayTypeAction',NULL,NULL,1,'2006-08-31');
INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'SpecimenArrayType','SpecimenArrayType Class','edu.wustl.catissuecore.domain.SpecimenArrayType',NULL,NULL,1,'2006-08-31');
INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType','edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType','edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType',NULL,NULL,1,'2006-08-31');

INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,17,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayTypeAction'),'0000-00-00');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,1,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.domain.SpecimenArrayType'),'0000-00-00');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,17,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAction';
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.domain.SpecimenArray';
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArray';

INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'edu.wustl.catissuecore.action.SpecimenArrayAction','edu.wustl.catissuecore.action.SpecimenArrayAction','edu.wustl.catissuecore.action.SpecimenArrayAction',NULL,NULL,1,'2006-08-31');
INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'SpecimenArray','SpecimenArray Class','edu.wustl.catissuecore.domain.SpecimenArray',NULL,NULL,1,'2006-08-31');
INSERT into `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArray','edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArray','edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArray',NULL,NULL,1,'2006-08-31');

INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAction'),'0000-00-00');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,3,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.domain.SpecimenArray'),'0000-00-00');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArray'),'0000-00-00');
#--- End: update by Ashwin

alter table catissue_container_type add column activity_status varchar(30);
#--update catissue_container_type a set activity_status = (select activity_status from catissue_storage_type b where a.identifier = b.identifier);
alter table catissue_storage_type drop column activity_status;

create table CATISSUE_STORTY_HOLDS_SPARRTY (
   STORAGE_TYPE_ID BIGINT not null,
   SPECIMEN_ARRAY_TYPE_ID BIGINT not null,
   primary key (STORAGE_TYPE_ID, SPECIMEN_ARRAY_TYPE_ID)
);
alter table CATISSUE_STORTY_HOLDS_SPARRTY add index (STORAGE_TYPE_ID), add constraint FK70F57E4459A3CE5C foreign key (STORAGE_TYPE_ID) references CATISSUE_STORAGE_TYPE (IDENTIFIER);
alter table CATISSUE_STORTY_HOLDS_SPARRTY add index (SPECIMEN_ARRAY_TYPE_ID), add constraint FK70F57E44ECE89343 foreign key (SPECIMEN_ARRAY_TYPE_ID) references CATISSUE_SPECIMEN_ARRAY_TYPE (IDENTIFIER);

create table CATISSUE_CONT_HOLDS_SPARRTYPE (
   STORAGE_CONTAINER_ID BIGINT not null,
   SPECIMEN_ARRAY_TYPE_ID BIGINT not null,
   primary key (STORAGE_CONTAINER_ID, SPECIMEN_ARRAY_TYPE_ID)
);
alter table CATISSUE_CONT_HOLDS_SPARRTYPE add index (SPECIMEN_ARRAY_TYPE_ID), add constraint FKDC7E31E2ECE89343 foreign key (SPECIMEN_ARRAY_TYPE_ID) references CATISSUE_SPECIMEN_ARRAY_TYPE (IDENTIFIER);
alter table CATISSUE_CONT_HOLDS_SPARRTYPE add index (STORAGE_CONTAINER_ID), add constraint FKDC7E31E2B3DFB11D foreign key (STORAGE_CONTAINER_ID) references CATISSUE_STORAGE_CONTAINER (IDENTIFIER);

/* adding default entry for specimen array type */
drop table if exists catissue_temp_type;


CREATE TABLE catissue_temp_type (                                                                                                      
                         `IDENTIFIER` bigint(20),                                                                                          
                         `CAPACITY_ID` bigint(20),                                                                                                   
                         `NAME` varchar(100),                                                                                         
                         `ONE_DIMENSION_LABEL` varchar(100),                                                                                           
                         `TWO_DIMENSION_LABEL` varchar(100),                                                                                           
                          `COMMENTS` text(20),                                                                                  
                         `ACTIVITY_STATUS` varchar(20)
                       );

                                                                                               
insert into catissue_temp_type (select * from catissue_container_type where identifier=2 and name!='Any');
update catissue_temp_type set identifier=(select max(identifier)+1 from catissue_container_type);
update catissue_container_type set name='Any',activity_status='Disabled' where identifier=2;
insert into catissue_container_type (select * from catissue_temp_type);

alter table catissue_storage_container drop foreign key FK28429D0159A3CE5C; 
update catissue_storage_type set identifier=(select identifier from catissue_temp_type) where identifier=2;
update catissue_storage_container set storage_type_id = (select identifier from catissue_temp_type) where storage_type_id = 2 ;
alter table catissue_storage_container add constraint FK28429D0159A3CE5C foreign key (STORAGE_TYPE_ID) references catissue_storage_type (IDENTIFIER);

#-- insert into catissue_container_type (name,activity_status,identifier) values ('Any','Disabled',2);
insert into catissue_storage_type (identifier, default_temperature) values (2,0);

insert into catissue_specimen_array_type (IDENTIFIER) values ( '2');
drop table catissue_temp_type;


update catissue_container_type set activity_status='Active' where name != 'Any';
update catissue_container_type set activity_status='Disabled' where name = 'Any';
#--- Start: update by Ashwin
alter table CATISSUE_COLLECTION_PROTOCOL add column ALIQUOT_IN_SAME_CONTAINER bit;
alter table CATISSUE_SPECIMEN_ARRAY add column AVAILABLE bit;
#--- End

/* Aarti: Deleting due to Bug#1854 - To assign or revoke use privilege on storage containers and sites should NOT only apply to technician group users but also to supervisors.*/
delete from csm_role_privilege where role_privilege_id = 10;

/*Vaishali - 20/09/2006 - Added for disposable events related bug*/
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.DisposalEventParametersAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.DisposalEventParametersAction','edu.wustl.catissuecore.action.SimilarContainersAction','edu.wustl.catissuecore.action.DisposalEventParametersAction',NULL,NULL,1,'2006-09-20');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,3,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.DisposalEventParametersAction'),'0000-00-00');
/* Rahul - Added for distribution related changes*/
DELETE FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution_array';
INSERT into CSM_PROTECTION_ELEMENT (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE` ) VALUES (NULL,'edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution_array','edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenArrayType','edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution_array',NULL,NULL,1,'2006-08-31'); 
INSERT INTO CSM_PG_PE (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution_array'),'0000-00-00');

/*Santosh - Updated first user password table's update_date = current date -Required for new password func*/
UPDATE catissue_password set UPDATE_DATE=now() WHERE IDENTIFIER = 1;
alter table CATISSUE_USER add column FIRST_TIME_LOGIN bit default 1;

/* storage type unique changes */
update catissue_container_type set name = 'Vše' where identifier = 1;
alter table CATISSUE_container_type add constraint NAME unique (NAME);

update catissue_container set Name=Identifier where Name = '';
alter table CATISSUE_container add constraint NAME unique (NAME);

/*Poornima -26/09/06-Added unspecified value to Vital status and NOT SPECIFIED value in Tissue Site- */
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2641,'Nespecifikováno',NULL,'2004001');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2642,'NOT SPECIFIED',NULL,'Tissue_Site_PID');

/*Query audit changes - 5th oct 2006 - by vaishali*/
create table CATISSUE_AUDIT_EVENT_QUERY_LOG (
   IDENTIFIER bigint not null auto_increment,
   QUERY_DETAILS longtext,  
   AUDIT_EVENT_ID bigint,
   primary key (IDENTIFIER)
);
alter table CATISSUE_AUDIT_EVENT_QUERY_LOG add index FK62DC439DBC7298A9 (AUDIT_EVENT_ID), add constraint FK62DC439DBC7298A9 foreign key (AUDIT_EVENT_ID) references CATISSUE_AUDIT_EVENT (IDENTIFIER);

/* query audit changes finish */

/* changes for making aliquotAction a secureAction - by vaishali*/
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.AliquotAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.AliquotAction','edu.wustl.catissuecore.action.AliquotAction','edu.wustl.catissuecore.action.AliquotAction',NULL,NULL,1,'2006-10-11');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.ALiquotAction'),'0000-00-00');

/* finish */

/*Poornima - 11 Oct 06 :Bug 1718 - Changes to Clinical Diagnosis values*/
Delete from CATISSUE_PERMISSIBLE_VALUE where VALUE = 'LEUKEMIAS' AND  PARENT_IDENTIFIER is NULL and PUBLIC_ID='Clinical_Diagnosis_PID';
Delete from CATISSUE_PERMISSIBLE_VALUE where VALUE = 'HODGKIN''S AND NON-HODGKIN''S LYMPHOMA ' AND  PARENT_IDENTIFIER is NULL and PUBLIC_ID='Clinical_Diagnosis_PID';
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2643,'Eosinophilic leukemia',2154,NULL);
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2644,'Lymphosarcoma cell leukemia',1825,NULL);

/*Poornima: Need "No Disease" in Clinical Diagnosis Value Domain -  Bug -2735*/
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2645,'No Disease',NULL,'Clinical_Diagnosis_PID');

/*Poornima: New Type Value for Class "Buňka" -  Bug -2779*/
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2646,'Slide',2,NULL);

/*Jitendra: Bug-1399: Non Required Fields*/
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2647,'Nespecifikováno',NULL,'2003990');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2648,'Nespecifikováno',NULL,'Clinical_Diagnosis_PID');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2649,'Nespecifikováno',NULL,'Race_PID');
INSERT INTO CATISSUE_PERMISSIBLE_VALUE (IDENTIFIER, VALUE, PARENT_IDENTIFIER, PUBLIC_ID) VALUES(2650,'Nespecifikováno',NULL,'Ethnicity_PID');

UPDATE CATISSUE_PERMISSIBLE_VALUE SET VALUE = 'Nespecifikováno' where IDENTIFIER =  2642;

/* Mandar : 06Dec06: For MultipleSpecimen Actions  start */
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenAppletAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.MultipleSpecimenAppletAction','edu.wustl.catissuecore.action.MultipleSpecimenAppletAction','edu.wustl.catissuecore.action.MultipleSpecimenAppletAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenAppletAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenCopyPasteAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.MultipleSpecimenCopyPasteAction','edu.wustl.catissuecore.action.MultipleSpecimenCopyPasteAction','edu.wustl.catissuecore.action.MultipleSpecimenCopyPasteAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenCopyPasteAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAppletAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.SpecimenArrayAppletAction','edu.wustl.catissuecore.action.SpecimenArrayAppletAction','edu.wustl.catissuecore.action.SpecimenArrayAppletAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAppletAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.MultipleSpecimenAction','edu.wustl.catissuecore.action.MultipleSpecimenAction','edu.wustl.catissuecore.action.MultipleSpecimenAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.MultipleSpecimenAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.NewMultipleSpecimenAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.NewMultipleSpecimenAction','edu.wustl.catissuecore.action.NewMultipleSpecimenAction','edu.wustl.catissuecore.action.NewMultipleSpecimenAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.NewMultipleSpecimenAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.DerivedMultipleSpecimenAddAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.DerivedMultipleSpecimenAddAction','edu.wustl.catissuecore.action.DerivedMultipleSpecimenAddAction','edu.wustl.catissuecore.action.DerivedMultipleSpecimenAddAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.DerivedMultipleSpecimenAddAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.AddSpecimenAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.AddSpecimenAction','edu.wustl.catissuecore.action.AddSpecimenAction','edu.wustl.catissuecore.action.AddSpecimenAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.AddSpecimenAction'),'0000-00-00');

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.InitMultipleSpecimenAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.InitMultipleSpecimenAction','edu.wustl.catissuecore.action.InitMultipleSpecimenAction','edu.wustl.catissuecore.action.InitMultipleSpecimenAction',NULL,NULL,1,'2006-12-05');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.InitMultipleSpecimenAction'),'0000-00-00');

/* Mandar : 06Dec06: For MultipleSpecimen Actions  end */


/* Jitendra: Start:- 17dec06: Bug-3141*/

alter table CATISSUE_PARTICIPANT modify LAST_NAME varchar(255);
alter table CATISSUE_PARTICIPANT modify FIRST_NAME varchar(255);
alter table CATISSUE_PARTICIPANT modify MIDDLE_NAME varchar(255);
alter table CATISSUE_PARTICIPANT modify ACTIVITY_STATUS varchar(50);

alter table CATISSUE_SPECIMEN_PROTOCOL modify TITLE varchar(255) not null unique;
alter table CATISSUE_SPECIMEN_PROTOCOL modify SHORT_TITLE varchar(255);
alter table CATISSUE_SPECIMEN_PROTOCOL modify IRB_IDENTIFIER varchar(255);
alter table CATISSUE_SPECIMEN_PROTOCOL modify DESCRIPTION_URL varchar(255);

alter table CATISSUE_PART_MEDICAL_ID modify MEDICAL_RECORD_NUMBER varchar(255);

alter table CATISSUE_CANCER_RESEARCH_GROUP modify NAME varchar(255) not null unique;

alter table CATISSUE_INSTITUTION modify NAME varchar(255) not null unique;

alter table CATISSUE_DEPARTMENT modify NAME varchar(255) not null unique;

alter table CATISSUE_PASSWORD modify PASSWORD varchar(255);

alter table CATISSUE_USER modify FIRST_NAME varchar(255);
alter table CATISSUE_USER modify LAST_NAME varchar(255);
alter table CATISSUE_USER modify EMAIL_ADDRESS varchar(255);
alter table CATISSUE_USER modify LOGIN_NAME varchar(255) not null unique;

alter table CATISSUE_ADDRESS modify STREET varchar(255);

alter table CATISSUE_SPECIMEN modify LABEL varchar(255) unique;
alter table CATISSUE_SPECIMEN modify BARCODE varchar(255) unique;
alter table CATISSUE_SPECIMEN modify COMMENTS text;

alter table CATISSUE_SPECIMEN_COLL_GROUP modify NAME varchar(255) unique;

alter table CATISSUE_BIOHAZARD modify NAME varchar(255) not null unique;

alter table CATISSUE_SITE modify NAME varchar(255) not null unique;
alter table CATISSUE_SITE modify EMAIL_ADDRESS varchar(255);

alter table CATISSUE_EXTERNAL_IDENTIFIER modify NAME varchar(255);
alter table CATISSUE_EXTERNAL_IDENTIFIER modify VALUE varchar(255);

alter table CATISSUE_CONTAINER modify BARCODE varchar(255) unique;
alter table CATISSUE_CONTAINER modify NAME varchar(255) unique not null;
alter table CATISSUE_CONTAINER modify ACTIVITY_STATUS varchar(50);

alter table CATISSUE_CONTAINER_TYPE modify NAME varchar(255) unique;
alter table CATISSUE_CONTAINER_TYPE modify ONE_DIMENSION_LABEL varchar(255);
alter table CATISSUE_CONTAINER_TYPE modify TWO_DIMENSION_LABEL varchar(255);
alter table CATISSUE_CONTAINER_TYPE modify ACTIVITY_STATUS varchar(50);

alter table CATISSUE_COLL_PROT_REG modify PROTOCOL_PARTICIPANT_ID varchar(255);
alter table CATISSUE_COLL_PROT_REG modify ACTIVITY_STATUS varchar(50);

alter table CATISSUE_REPORTED_PROBLEM modify AFFILIATION varchar(255) not null;
alter table CATISSUE_REPORTED_PROBLEM modify NAME_OF_REPORTER varchar(255) not null;
alter table CATISSUE_REPORTED_PROBLEM modify SUBJECT varchar(255);
alter table CATISSUE_REPORTED_PROBLEM modify REPORTERS_EMAIL_ID varchar(255) not null;

alter table CATISSUE_MOL_SPE_REVIEW_PARAM modify GEL_IMAGE_URL varchar(255);

alter table CATISSUE_DISPOSAL_EVENT_PARAM modify REASON varchar(255);

alter table CATISSUE_PROCEDURE_EVENT_PARAM modify URL varchar(255) not null;
alter table CATISSUE_PROCEDURE_EVENT_PARAM modify NAME varchar(255) not null;

/* Jitendra: End:- 17dec06: Bug-3141*/

update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Biohazard', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Biohazard', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Biohazard' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Biohazard';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_CancerResearchGroup', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_CancerResearchGroup', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_CancerResearchGroup' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_CancerResearchGroup';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtocol', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtocol', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtocol' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_CollectionProtocol';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtReg', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtReg', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_CollectionProtReg' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_CollectionProtReg';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Department', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Department', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Department' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Department';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Distribution' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Distribution';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_DistributionProtocol', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_DistributionProtocol', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_DistributionProtocol' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_DistributionProtocol';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Institution', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Institution', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Institution' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Institution';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Participant', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Participant', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Participant' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Participant';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Site', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Site', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Site' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Site';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_Specimen', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_Specimen', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_Specimen' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_Specimen';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenCollectionGroup', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenCollectionGroup', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_SpecimenCollectionGroup' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_SpecimenCollectionGroup';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageContainer', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageContainer', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageContainer' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_StorageContainer';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageType', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageType', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_StorageType' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_StorageType';
update CSM_PROTECTION_ELEMENT set PROTECTION_ELEMENT_NAME='edu.wustl.common.action.SimpleQueryInterfaceAction_User', PROTECTION_ELEMENT_DESCRIPTION='edu.wustl.common.action.SimpleQueryInterfaceAction_User', OBJECT_ID='edu.wustl.common.action.SimpleQueryInterfaceAction_User' where OBJECT_ID='edu.wustl.catissuecore.action.SimpleQueryInterfaceAction_User';






/* changes for making cpbasedSearchAction a secureAction - by vaishali*/
DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.CPBasedSearchAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.CPBasedSearchAction','edu.wustl.catissuecore.action.CPBasedSearchAction','edu.wustl.catissuecore.action.CPBasedSearchAction',NULL,NULL,1,'2007-01-15');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.CPBasedSearchAction'),'0000-00-00');


/* finish */

DELETE FROM `CSM_PROTECTION_ELEMENT` WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAliquotAction';
INSERT INTO `CSM_PROTECTION_ELEMENT` (`PROTECTION_ELEMENT_ID`,`PROTECTION_ELEMENT_NAME`,`PROTECTION_ELEMENT_DESCRIPTION`,`OBJECT_ID`,`ATTRIBUTE`,`PROTECTION_ELEMENT_TYPE_ID`,`APPLICATION_ID`,`UPDATE_DATE`) VALUES (NULL,'edu.wustl.catissuecore.action.SpecimenArrayAliquotAction','edu.wustl.catissuecore.action.SpecimenArrayAliquotAction','edu.wustl.catissuecore.action.SpecimenArrayAliquotAction',NULL,NULL,1,'2007-01-15');
INSERT INTO `CSM_PG_PE` (`PG_PE_ID`,`PROTECTION_GROUP_ID`,`PROTECTION_ELEMENT_ID`,`UPDATE_DATE`) VALUES (NULL,19,(SELECT PROTECTION_ELEMENT_ID FROM CSM_PROTECTION_ELEMENT WHERE OBJECT_ID = 'edu.wustl.catissuecore.action.SpecimenArrayAliquotAction'),'0000-00-00');

/* Added for role of coordinator - by Santosh */
INSERT INTO `CSM_ROLE` (`ROLE_ID`,`ROLE_NAME`,`ROLE_DESCRIPTION`,`APPLICATION_ID`,`ACTIVE_FLAG`,`UPDATE_DATE`) VALUES (11,'Coordinator','Role for Coordinator',1,0,'0000-00-00');
INSERT INTO `CSM_ROLE_PRIVILEGE` (`ROLE_PRIVILEGE_ID`,`ROLE_ID`,`PRIVILEGE_ID`,`UPDATE_DATE`) VALUES (28,11,3,'0000-00-00');
INSERT INTO `CSM_ROLE_PRIVILEGE` (`ROLE_PRIVILEGE_ID`,`ROLE_ID`,`PRIVILEGE_ID`,`UPDATE_DATE`) VALUES (29,11,11,'0000-00-00');

