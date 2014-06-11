insert into catissue_department values(CATISSUE_DEPARTMENT_SEQ.nextval,'@@first.admin.department@@');
insert into catissue_institution  values(CATISSUE_INSTITUTION_SEQ.nextval,'@@first.admin.institution@@');
insert into catissue_cancer_research_group  values(CATISSUE_CANCER_RES_GRP_SEQ.nextval,'@@first.admin.cancerresearchgroup@@');
insert into CATISSUE_ADDRESS (identifier,city,state,country,zipcode) values(CATISSUE_ADDRESS_SEQ.nextVal,'Nespecifikováno',null,'United States',null);

UPDATE CSM_USER SET LOGIN_NAME='@@first.admin.emailAddress@@',
					DEPARTMENT=1,
					EMAIL_ID='@@first.admin.emailAddress@@',
					PASSWORD='@@first.admin.encodedPassword@@'
				WHERE USER_ID=1;	

UPDATE catissue_user SET EMAIL_ADDRESS='@@first.admin.emailAddress@@',
							LOGIN_NAME='@@first.admin.emailAddress@@',
							DEPARTMENT_ID=1,
							INSTITUTION_ID=1,
							CANCER_RESEARCH_GROUP_ID=1,
							ADDRESS_ID=1
						WHERE 
							IDENTIFIER = 1;

							
UPDATE catissue_password set PASSWORD='@@first.admin.encodedPassword@@',
							UPDATE_DATE=sysdate
						WHERE 
							IDENTIFIER = 1;