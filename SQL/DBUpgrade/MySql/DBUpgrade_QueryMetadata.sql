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