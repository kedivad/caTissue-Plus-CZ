LOAD DATA INFILE 'H://caTissue//work//workspace//catissuecoreNew/SQL/DBUpgrade/Common/CAModelCSVs/ASSOCIATION.csv' 
APPEND 
INTO TABLE ASSOCIATION 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(ASSOCIATION_ID NULLIF ASSOCIATION_ID='\\N',ASSOCIATION_TYPE NULLIF ASSOCIATION_TYPE='\\N')