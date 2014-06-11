alter table CATISSUE_SPECIMEN_PROTOCOL add column LABEL_FORMAT varchar(255) default null;

alter table CATISSUE_SPECIMEN_PROTOCOL add column DERIV_LABEL_FORMAT varchar(255) default null;
alter table CATISSUE_SPECIMEN_PROTOCOL add column ALIQUOT_LABEL_FORMAT varchar(255) default null;

CREATE TABLE KEY_SEQ_GENERATOR
   (	IDENTIFIER bigint(20) NOT NULL auto_increment,
	KEY_VALUE VARCHAR(50) NOT NULL,
	KEY_SEQUENCE_ID VARCHAR(50) NOT NULL,
	KEY_TYPE VARCHAR(255) NOT NULL,
	 PRIMARY KEY (IDENTIFIER)
	 );


update DYEXTN_ROLE set ASSOCIATION_TYPE = 'CONTAINTMENT'
where identifier in
(
	select source_role_id from DYEXTN_ASSOCIATION where identifier in
	(
		select de_association_id from INTRA_MODEL_ASSOCIATION where association_id =
		(
			select intermediate_path from PATH where first_entity_id =
			(
				select identifier from DYEXTN_ABSTRACT_METADATA
				where name = 'edu.wustl.catissuecore.domain.SpecimenArrayContent'
			)
			and last_entity_id =
			(
				select identifier from DYEXTN_ABSTRACT_METADATA
				where name = 'edu.wustl.catissuecore.domain.SpecimenArray'
			)
		)
	)
);