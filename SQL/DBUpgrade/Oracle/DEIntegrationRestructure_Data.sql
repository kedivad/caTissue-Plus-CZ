alter table CATISSUE_STUDY_FORM_CONTEXT add constraint FKC6723622BC7298A9 foreign key (IDENTIFIER) references DYEXTN_ABSTRACT_FORM_CONTEXT (IDENTIFIER);
alter table CATISSUE_PARTICIPANT_REC_NTRY add constraint FKC6723656BC7298A9 foreign key (IDENTIFIER) references DYEXTN_ABSTRACT_RECORD_ENTRY (IDENTIFIER);
alter table CATISSUE_SPECIMEN_REC_NTRY add constraint FKC6727856BC7298A9 foreign key (IDENTIFIER) references DYEXTN_ABSTRACT_RECORD_ENTRY (IDENTIFIER);
alter table CATISSUE_SCG_REC_NTRY add constraint FKC6723689BC7298A9 foreign key (IDENTIFIER) references DYEXTN_ABSTRACT_RECORD_ENTRY (IDENTIFIER);

delete from DYEXTN_ENTITY_MAP_CONDNS where form_context_id is null;

delete from DYEXTN_ENTITY_MAP_CONDNS where identifier not in
(select min(identifier) from DYEXTN_ENTITY_MAP_CONDNS T2
where T2.form_context_id=DYEXTN_ENTITY_MAP_CONDNS.form_context_id);

insert into DYEXTN_ABSTRACT_FORM_CONTEXT (identifier,form_label,container_id,hide_form)
 (select DYEXTN_ABSTRACT_FRM_CTXT_SEQ.NEXTVAL,fc.study_form_label,em.container_id,1 from DYEXTN_FORM_CONTEXT fc,
 DYEXTN_ENTITY_MAP em, DYEXTN_ENTITY_MAP_CONDNS cond
 where fc.entity_map_id=em.identifier and cond.form_context_id=fc.identifier
 and cond.STATIC_RECORD_ID=0);

insert into DYEXTN_ABSTRACT_FORM_CONTEXT (identifier,form_label,container_id,hide_form)
 (select DYEXTN_ABSTRACT_FRM_CTXT_SEQ.NEXTVAL,fc.study_form_label,em.container_id,0 from DYEXTN_FORM_CONTEXT fc,
 DYEXTN_ENTITY_MAP em, DYEXTN_ENTITY_MAP_CONDNS cond
 where fc.entity_map_id=em.identifier and cond.form_context_id=fc.identifier
 and cond.STATIC_RECORD_ID<>0);

insert into DYEXTN_ABSTRACT_FORM_CONTEXT (identifier,form_label,container_id,hide_form)
(select DYEXTN_ABSTRACT_FRM_CTXT_SEQ.NEXTVAL,fc.study_form_label,em.container_id,0 from DYEXTN_ENTITY_MAP em,DYEXTN_FORM_CONTEXT fc
left join DYEXTN_ENTITY_MAP_CONDNS cond on cond.form_context_id=fc.identifier
where fc.entity_map_id=em.identifier and fc.identifier not in
(select fc1.identifier from DYEXTN_FORM_CONTEXT fc1 join DYEXTN_ENTITY_MAP_CONDNS cond1 on
cond1.form_context_id=fc1.identifier));

insert into CATISSUE_STUDY_FORM_CONTEXT (identifier)
(select identifier from DYEXTN_ABSTRACT_FORM_CONTEXT);

insert into CATISSUE_CP_STUDYFORMCONTEXT(STUDY_FORM_CONTEXT_ID,COLLECTION_PROTOCOL_ID)
(select afc.identifier, cond.STATIC_RECORD_ID from DYEXTN_ABSTRACT_FORM_CONTEXT afc,
DYEXTN_ENTITY_MAP_CONDNS cond, DYEXTN_ENTITY_MAP em, DYEXTN_FORM_CONTEXT fc
where afc.hide_form=0 and afc.container_id=em.container_id
and cond.FORM_CONTEXT_ID = fc.identifier and fc.ENTITY_MAP_ID = em.identifier and cond.STATIC_RECORD_ID>0);

-- Change Participant associations to ParticipantRecordEntry
update DYEXTN_ATTRIBUTE da set da.entiy_id = (select identifier from DYEXTN_ABSTRACT_METADATA where name like 'edu.wustl.catissuecore.domain.deintegration.ParticipantRecordEntry')
where da.identifier in (select identifier from dyextn_association where target_entity_id in (select ABSTRACT_ENTITY_ID from DYEXTN_CONTAINER where IDENTIFIER
in (select container_id from DYEXTN_ENTITY_MAP where static_entity_id=844))) and da.entiy_id=844;

-- SCG
update DYEXTN_ATTRIBUTE da set da.entiy_id = (select identifier from DYEXTN_ABSTRACT_METADATA where name like 'edu.wustl.catissuecore.domain.deintegration.SCGRecordEntry')
where da.identifier in (select identifier from dyextn_association where target_entity_id in (select ABSTRACT_ENTITY_ID from DYEXTN_CONTAINER where IDENTIFIER
in (select container_id from DYEXTN_ENTITY_MAP where static_entity_id=379))) and da.entiy_id=379;

-- Specimen
update DYEXTN_ATTRIBUTE da set da.entiy_id = (select identifier from DYEXTN_ABSTRACT_METADATA where name like 'edu.wustl.catissuecore.domain.deintegration.SpecimenRecordEntry')
where da.identifier in (select identifier from dyextn_association where target_entity_id in (select ABSTRACT_ENTITY_ID from DYEXTN_CONTAINER where IDENTIFIER
in (select container_id from DYEXTN_ENTITY_MAP where static_entity_id=4))) and da.entiy_id=4;


--drop table DYEXTN_ENTITY_MAP_RECORD
--drop table DYEXTN_ENTITY_MAP_CONDNS
--drop table DYEXTN_FORM_CONTEXT
--drop table DYEXTN_ENTITY_MAP