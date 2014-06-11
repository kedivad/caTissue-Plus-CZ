
/*DE constraint properties, create table.*/

create table DYEXTN_ENTIY_COMPOSITE_KEY_REL (ENTITY_ID bigint not null auto_increment,
ATTRIBUTE_ID bigint not null, INSERTION_ORDER bigint not null, primary key (ENTITY_ID, INSERTION_ORDER));

create table DYEXTN_CONSTRAINTKEY_PROP (IDENTIFIER bigint not null auto_increment,
PRIMARY_ATTRIBUTE_ID bigint, SRC_CONSTRAINT_KEY_ID bigint, TGT_CONSTRAINT_KEY_ID bigint, primary key (IDENTIFIER));


ALTER TABLE DYEXTN_ENTIY_COMPOSITE_KEY_REL
 ENGINE=INNODB;

ALTER TABLE DYEXTN_CONSTRAINTKEY_PROP
 ENGINE=INNODB;

/*DE constraint properties, alter table.*/

alter table DYEXTN_COLUMN_PROPERTIES add CNSTR_KEY_PROP_ID bigint;

alter table DYEXTN_CONSTRAINTKEY_PROP add index IDX_DYEXTN_CONSTRAINTKEY_PROP_SRC_CONSTRAINT_KEY_ID (SRC_CONSTRAINT_KEY_ID), add constraint FK_DYEXTN_CONSTRAINTKEY_PROP_SRC_CONSTRAINT_KEY_ID foreign key (SRC_CONSTRAINT_KEY_ID) references DYEXTN_CONSTRAINT_PROPERTIES(IDENTIFIER);

alter table DYEXTN_CONSTRAINTKEY_PROP add index IDX_DYEXTN_CONSTRAINTKEY_PROP_TGT_CONSTRAINT_KEY_ID (TGT_CONSTRAINT_KEY_ID), add constraint FK_DYEXTN_CONSTRAINTKEY_PROP_TGT_CONSTRAINT_KEY_ID foreign key (TGT_CONSTRAINT_KEY_ID) references DYEXTN_CONSTRAINT_PROPERTIES(IDENTIFIER);

alter table DYEXTN_CONSTRAINTKEY_PROP add index IDX_DYEXTN_CONSTRAINTKEY_PROP_PRIMARY_ATTRIBUTE_ID (PRIMARY_ATTRIBUTE_ID), add constraint FK_DYEXTN_CONSTRAINTKEY_PROP_PRIMARY_ATTRIBUTE_ID foreign key (PRIMARY_ATTRIBUTE_ID) references DYEXTN_PRIMITIVE_ATTRIBUTE(IDENTIFIER);

alter table DYEXTN_COLUMN_PROPERTIES add index IDX_DYEXTN_COLUMN_PROPERTIES_CNSTR_KEY_PROP_ID(CNSTR_KEY_PROP_ID), add constraint FK_DYEXTN_COLUMN_PROPERTIES_CNSTR_KEY_PROP_ID foreign key (CNSTR_KEY_PROP_ID) references DYEXTN_CONSTRAINTKEY_PROP(IDENTIFIER);

alter table DYEXTN_CONSTRAINT_PROPERTIES add CONSTRAINT_NAME varchar(255);

alter table DYEXTN_CONSTRAINT_PROPERTIES add ABSTRACT_ENTITY_ID bigint;

alter table DYEXTN_CONSTRAINT_PROPERTIES add index  IDX_DYEXTN_CONSTRAINT_PROPERTIES_ABSTRACT_ENTITY_ID(ABSTRACT_ENTITY_ID), add constraint FK_DYEXTN_CONSTRAINT_PROPERTIES_ABSTRACT_ENTITY_ID foreign key (ABSTRACT_ENTITY_ID) references DYEXTN_ABSTRACT_ENTITY(ID);

alter table DYEXTN_ENTIY_COMPOSITE_KEY_REL add index IDX_DYEXTN_ENTIY_COMPOSITE_KEY_REL_ENTITY_ID(ENTITY_ID), add constraint FK_DYEXTN_ENTIY_COMPOSITE_KEY_REL_ENTITY_ID foreign key (ENTITY_ID) references DYEXTN_ENTITY(IDENTIFIER);

alter table DYEXTN_ENTIY_COMPOSITE_KEY_REL add index IDX_DYEXTN_ENTIY_COMPOSITE_KEY_REL_ATTRIBUTE_ID(ATTRIBUTE_ID), add constraint FK_DYEXTN_ENTIY_COMPOSITE_KEY_REL_ATTRIBUTE_ID foreign key (ATTRIBUTE_ID) references DYEXTN_PRIMITIVE_ATTRIBUTE(IDENTIFIER);