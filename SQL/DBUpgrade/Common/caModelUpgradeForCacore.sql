--clinical_annotation updates
update DYEXTN_ROLE set name = 'radiationTherapy' where identifier=998;
update DYEXTN_ROLE set name = 'deprecatedAnnotation2' where identifier=905;
update DYEXTN_ROLE set name = 'deprecatedAnnotation2' where identifier=907;

--pathology_specimen updates
update DYEXTN_ROLE set name = 'additionalFinding' where name='Additional Finding';
update DYEXTN_ROLE set name = 'breastSpecimenPathologyAnnotation' where identifier=1221;
update DYEXTN_ROLE set name = 'breastSpecimenNottinghamHistologicScore' where identifier=1222;
update DYEXTN_ROLE set name = 'prostateSpecimenPathologyAnnotation' where identifier=1219;
update DYEXTN_ROLE set name = 'prostateSpecimenGleasonScore' where identifier=1220;

--check whether to delete ------------ 1322, 1318 -- need to delete hierarchy
update DYEXTN_ABSTRACT_METADATA set name = 'SpecimenDetails1' where identifier=1322;

--   delete association between 1365 and 1369 and delete 1369 from DYEXTN_ABSTRACT_METADATA?
delete from DYEXTN_COLUMN_PROPERTIES where cnstr_key_prop_id=(select identifier from DYEXTN_CONSTRAINTKEY_PROP where src_constraint_key_id=1371 or tgt_constraint_key_id=1371);
delete from DYEXTN_CONSTRAINTKEY_PROP where src_constraint_key_id=1371 or tgt_constraint_key_id=1371;
delete from DYEXTN_CONSTRAINT_PROPERTIES where association_id=1388;
delete from DYEXTN_ASSOCIATION where source_role_id in (959,960) or target_role_id in (959,960);
delete from DYEXTN_ATTRIBUTE where identifier = 1388;
delete from DYEXTN_BASE_ABSTRACT_ATTRIBUTE where identifier = 1388;
delete from DYEXTN_ROLE  where identifier in (959,960);
delete  from PATH where intermediate_path='704';
delete  from INTRA_MODEL_ASSOCIATION where de_association_id=1388;
--delete from DYEXTN_ABSTRACT_METADATA where identifier=1369

-----delete association between SpecimenGleasonScore -- 1381 and ProstateSpecimenPathologyAnnotation --1377
---and delete 1381 ---
delete from DYEXTN_COLUMN_PROPERTIES where cnstr_key_prop_id=(select identifier from DYEXTN_CONSTRAINTKEY_PROP where src_constraint_key_id=1381 or tgt_constraint_key_id=1381);
delete from DYEXTN_CONSTRAINTKEY_PROP where src_constraint_key_id=1381 or tgt_constraint_key_id=1381;
delete from DYEXTN_CONSTRAINT_PROPERTIES where association_id=1389;
delete from DYEXTN_ASSOCIATION where source_role_id in (962,961) or target_role_id in (962,961);
delete from DYEXTN_ATTRIBUTE where identifier = 1389;
delete from DYEXTN_BASE_ABSTRACT_ATTRIBUTE where identifier = 1389;
delete from DYEXTN_ROLE where identifier in (962,961);
delete from PATH where intermediate_path='699';
delete from INTRA_MODEL_ASSOCIATION where de_association_id=1389;
--delete from DYEXTN_ABSTRACT_METADATA where identifier=1389

--pathology_scg updates -- these role names were null
update DYEXTN_ROLE set name = 'baseSolidTissuePathologyAnnotation' where identifier=1327;
update DYEXTN_ROLE set name = 'pathologicalStaging' where identifier=1329;
update DYEXTN_ROLE set name = 'distantMetastasis' where identifier=1331;
update DYEXTN_ROLE set name = 'radicalProstatectomyPathologyAnnotation' where identifier=1333;
update DYEXTN_ROLE set name = 'radicalProstatectomyMargin' where identifier=1335;
update DYEXTN_ROLE set name = 'localExcisionBasedColorectalPathologyAnnotation' where identifier=1337;
update DYEXTN_ROLE set name = 'localExcisionColorectalLateralMargin' where identifier=1339;