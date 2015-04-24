package model;

import java.util.Map;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

@MappedSuperclass
@Access(AccessType.FIELD)
public abstract class Model {
	@Id
	protected String ID;
	@Version
	private int version;
	protected boolean enabled;

	public abstract void init(Map<String, Object> parameters);

	public abstract Map<String, Object> toRepresentation();

	public abstract void delete();
}
