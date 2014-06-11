
/*Added by Preeti : This is requird to be done when catissuecore metadata is dumped. We need to set
isPrimaryKey = 1 for all id attributes. */

update dyextn_primitive_attribute set IS_PRIMARY_KEY ='1' where
identifier = (select IDENTIFIER from DYEXTN_ABSTRACT_METADATA where name='id' and DYEXTN_ABSTRACT_METADATA.identifier = dyextn_primitive_attribute.identifier)