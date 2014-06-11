alter table CATISSUE_COLLECTION_PROTOCOL add IS_EMPI_ENABLE  number(1,0);

update CATISSUE_COLLECTION_PROTOCOL set IS_EMPI_ENABLE ='0';

alter table CATISSUE_PARTICIPANT add EMPI_ID_STATUS varchar2(50);

ALTER TABLE CATISSUE_SITE ADD FACILITY_ID varchar2(50);

alter table CATISSUE_PERMISSIBLE_VALUE add SORTORDER number(11,0);

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 1 where VALUE='Bílá' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 2 where VALUE='Černá nebo Africká' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 3 where VALUE='Indián nebo Aljašský domorodec' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 4 where VALUE='Asijská' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 5 where VALUE='Havajský domorodec nebo jiný Pacifický ostrovan' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 6 where VALUE='Nenahlášeno' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 7 where VALUE='Other' and PUBLIC_ID='Race_PID';

update CATISSUE_PERMISSIBLE_VALUE set SORTORDER = 8 where VALUE='Neznámo' and PUBLIC_ID='Race_PID';

   
commit;