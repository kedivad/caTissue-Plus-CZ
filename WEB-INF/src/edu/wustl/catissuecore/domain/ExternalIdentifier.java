/**
 * <p>Title: ExternalIdentifier Class>
 * <p>Description: A pre-existing, externally defined
 * id associated with a specimen.</p>
 * Copyright:    Copyright (c) year
 * Company: Washington University, School of Medicine, St. Louis.
 * @author Gautam Shetty
 * @version 1.00
 */

package edu.wustl.catissuecore.domain;

import krishagni.catissueplus.dto.ExternalIdentifierDTO;
import edu.wustl.common.actionForm.IValueObject;
import edu.wustl.common.domain.AbstractDomainObject;
import edu.wustl.common.exception.AssignDataException;

/**
 * A pre-existing, externally defined
 * id associated with a specimen.
 * @hibernate.class table="CATISSUE_EXTERNAL_IDENTIFIER"
 * @author gautam_shetty
 */

public class ExternalIdentifier extends AbstractDomainObject
{

	/**
	 * Serial Version ID.
	 */
	private static final long serialVersionUID = 1234567890L;

	/**
	 * System generated unique id.
	 */
	protected Long id;

	/**
	 * Name of the legacy id.
	 */
	protected String name;

	/**
	 * Value of the legacy id.
	 */
	protected String value;

	/**
	 * Specimen.
	 */
	protected Specimen specimen;

	/**
	 * Returns the system generated unique id.
	 * @hibernate.id name="id" column="IDENTIFIER" type="long" length="30"
	 * unsaved-value="null" generator-class="native"
	 * @hibernate.generator-param name="sequence" value="CATISSUE_EXTERNAL_ID_SEQ"
	 * @return the system generated unique id.
	 * @see #setId(Long)
	 * */
	@Override
	public Long getId()
	{
		return this.id;
	}

	/**
	 * Sets the system generated unique id.
	 * @param identifier the system generated unique id.
	 * @see #getId()
	 * */
	@Override
	public void setId(Long identifier)
	{
		this.id = identifier;
	}

	/**
	 * Returns the name of the legacy id.
	 * @hibernate.property name="name" type="string"
	 * column="NAME" length="255"
	 * @return the name of the legacy id.
	 * @see #setName(String)
	 */
	public String getName()
	{
		return this.name;
	}

	/**
	 * Sets the name of the legacy id.
	 * @param name the name of the legacy id.
	 * @see #getName()
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/**
	 * Returns the value of the legacy id.
	 * @hibernate.property name="value" type="string"
	 * column="VALUE" length="255"
	 * @return the value of the legacy id.
	 * @see #setValue(String)
	 */
	public String getValue()
	{
		return this.value;
	}

	/**
	 * Sets the value of the legacy id.
	 * @param value the value of the legacy id.
	 * @see #getValue()
	 */
	public void setValue(String value)
	{
		this.value = value;
	}

	/**
	 * @hibernate.many-to-one column="SPECIMEN_ID" class="edu.wustl.catissuecore.
	 * domain.Specimen" constrained="true"
	 * @see #setParticipant(Site)
	 * @return Specimen
	 */
	public Specimen getSpecimen()
	{
		return this.specimen;
	}

	/**
	 * @param specimen The specimen to set.
	 */
	public void setSpecimen(Specimen specimen)
	{
		this.specimen = specimen;
	}

	/* (non-Javadoc)
	 * @see edu.wustl.catissuecore.domain.AbstractDomainObject#setAllValues(edu.
	 * wustl.catissuecore.actionForm.AbstractActionForm)
	 */
	/**
	 * Set All Values.
	 * @param abstractForm IValueObject
	 * @throws AssignDataException AssignDataException.
	 */
	@Override
	public void setAllValues(IValueObject abstractForm) throws AssignDataException
	{
		//
	}

	/**
	 * To String Method.
	 * @return String.
	 */
	@Override
	public String toString()
	{
		return "EI{" + "id " + this.id + "\t" + "Name " + this.name + "\t" + "Value " + this.value
				+ "}";
	}

	/**
	 * Default Constructor.
	 */
	public ExternalIdentifier()
	{
		super();
	}

	/**
	 * Parameterized Constructor.
	 * @param externalIdentifier ExternalIdentifier.
	 */
	public ExternalIdentifier(ExternalIdentifier externalIdentifier)
	{
		super();
		this.name = externalIdentifier.getName();
		this.value = externalIdentifier.getValue();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
		{
			return true;
		}
		if (obj == null)
		{
			return false;
		}
		if (obj instanceof ExternalIdentifierDTO)
		{
			ExternalIdentifierDTO externalIdentifierDTO = (ExternalIdentifierDTO) obj;
			if (externalIdentifierDTO.getId() == null)
				return false;
			else if (this.id.compareTo(externalIdentifierDTO.getId()) == 0)
				return true;
			else
				return false;
		}
		else if (!(obj instanceof ExternalIdentifier))
		{
			return false;
		}
		ExternalIdentifier other = (ExternalIdentifier) obj;
		if (id == null)
		{
			if (other.id != null)
			{
				return false;
			}
		}
		else if (!id.equals(other.id))
		{
			return false;
		}
		if (name == null)
		{
			if (other.name != null)
			{
				return false;
			}
		}
		else if (!name.equals(other.name))
		{
			return false;
		}
		if (value == null)
		{
			if (other.value != null)
			{
				return false;
			}
		}
		else if (!value.equals(other.value))
		{
			return false;
		}
		return true;
	}

	//	/* (non-Javadoc)
	//	 * @see java.lang.Object#hashCode()
	//	 */
	//	@Override
	//	public int hashCode()
	//	{
	//		int hash = 7;
	//		hash = 89 * hash + (this.id != null ? this.id.hashCode() : 0);
	//		return hash;
	//	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	//	@Override
	//	public boolean equals(Object obj)
	//	{
	//		if (obj == null)
	//			return false;
	//		else if (obj instanceof ExternalIdentifierDTO)
	//		{
	//			ExternalIdentifierDTO externalIdentifierDTO = (ExternalIdentifierDTO) obj;
	//			if (externalIdentifierDTO.getId() == null)
	//				return false;
	//			else if (this.id.compareTo(externalIdentifierDTO.getId()) == 0)
	//				return true;
	//		}
	//		else
	//		{
	//			ExternalIdentifier externalIdentifier = (ExternalIdentifier) obj;
	//			if (this.id == externalIdentifier.getId())
	//				return true;
	//		}
	//		return false;
	//	}

}