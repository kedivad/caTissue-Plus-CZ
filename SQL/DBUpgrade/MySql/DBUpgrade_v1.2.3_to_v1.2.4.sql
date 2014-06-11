alter table CATISSUE_COLLECTION_PROTOCOL add column IS_EMPI_ENABLE boolean;

update CATISSUE_COLLECTION_PROTOCOL set IS_EMPI_ENABLE = false; 
alter table CATISSUE_PARTICIPANT add column EMPI_ID_STATUS varchar(50);

alter table CATISSUE_SITE add column FACILITY_ID varchar(50);

create table PARTICIPANT_EMPI_ID_MAPPING (
   PERMANENT_PARTICIPANT_ID varchar(255),
   TEMPARARY_PARTICIPANT_ID varchar(255),
   OLD_EMPI_ID varchar(255)
);

alter table CATISSUE_PERMISSIBLE_VALUE add SORTORDER bigint(20);

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 1 where VALUE='Bílá' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 2 where VALUE='Černá nebo Africká' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 3 where VALUE='Indián nebo Aljašský domorodec' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 4 where VALUE='Asijská' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 5 where VALUE='Havajský domorodec nebo jiný Pacifický ostrovan' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 6 where VALUE='Nenahlášeno' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 7 where VALUE='Other' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 8 where VALUE='Neznámo' and PUBLIC_ID='Race_PID';

commit;

