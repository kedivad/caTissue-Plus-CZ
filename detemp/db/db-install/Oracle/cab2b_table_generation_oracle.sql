
DROP TABLE INTER_MODEL_ASSOCIATION CASCADE CONSTRAINTS;
DROP TABLE INTRA_MODEL_ASSOCIATION CASCADE CONSTRAINTS;
DROP TABLE ASSOCIATION CASCADE CONSTRAINTS;

/* Possible values for ASSOCIATION_TYPE are 1 and 2
ASSOCIATION_TYPE = 1 represents INTER_MODEL_ASSOCIATION.
ASSOCIATION_TYPE = 2 represents INTRA_MODEL_ASSOCIATION.
*/     
CREATE TABLE ASSOCIATION(
    ASSOCIATION_ID    NUMBER(38,0)    NOT NULL,
    ASSOCIATION_TYPE  NUMBER(8,0)    NOT NULL ,
    PRIMARY KEY (ASSOCIATION_ID)
);

CREATE TABLE INTER_MODEL_ASSOCIATION(
    ASSOCIATION_ID      NUMBER(38,0)  NOT NULL REFERENCES ASSOCIATION(ASSOCIATION_ID),
    LEFT_ENTITY_ID      NUMBER(38,0)  NOT NULL,
    LEFT_ATTRIBUTE_ID   NUMBER(38,0)  NOT NULL,
    RIGHT_ENTITY_ID     NUMBER(38,0)  NOT NULL,
    RIGHT_ATTRIBUTE_ID  NUMBER(38,0)  NOT NULL,
    PRIMARY KEY (ASSOCIATION_ID) 
);
CREATE TABLE INTRA_MODEL_ASSOCIATION(
    ASSOCIATION_ID    NUMBER(38,0)    NOT NULL REFERENCES ASSOCIATION(ASSOCIATION_ID),
    DE_ASSOCIATION_ID NUMBER(38,0)    NOT NULL,
    PRIMARY KEY (ASSOCIATION_ID) 
);

drop table ID_TABLE CASCADE CONSTRAINTS;

CREATE TABLE ID_TABLE(
    NEXT_ASSOCIATION_ID    NUMBER(38,0)    NOT NULL,
    PRIMARY KEY (NEXT_ASSOCIATION_ID)
);

insert into ID_TABLE(NEXT_ASSOCIATION_ID) values(1);

commit;
