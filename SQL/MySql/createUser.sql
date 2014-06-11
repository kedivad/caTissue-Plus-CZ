insert into CATISSUE_DEPARTMENT values(1,'@@first.admin.department@@');
insert into CATISSUE_INSTITUTION  values(1,'@@first.admin.institution@@');
insert into CATISSUE_CANCER_RESEARCH_GROUP  values(1,'@@first.admin.cancerresearchgroup@@');
insert into CATISSUE_ADDRESS (identifier,city,state,country,zipcode) values(1,'Nespecifikováno',null,'United States',null);

UPDATE CSM_USER SET LOGIN_NAME='@@first.admin.emailAddress@@',
					DEPARTMENT=1,
					EMAIL_ID='@@first.admin.emailAddress@@',
					PASSWORD='@@first.admin.encodedPassword@@'
				WHERE USER_ID=1;	

UPDATE CATISSUE_USER SET EMAIL_ADDRESS='@@first.admin.emailAddress@@',
							LOGIN_NAME='@@first.admin.emailAddress@@',
							DEPARTMENT_ID=1,
							INSTITUTION_ID=1,
							CANCER_RESEARCH_GROUP_ID=1,
							ADDRESS_ID=1
						WHERE 
							IDENTIFIER = 1;

							
UPDATE CATISSUE_PASSWORD set PASSWORD='@@first.admin.encodedPassword@@',
						UPDATE_DATE=now()
						WHERE 
							IDENTIFIER = 1;