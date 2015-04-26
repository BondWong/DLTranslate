package model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Lob;

@Entity
@Access(AccessType.FIELD)
public class Paragraph extends Model {
	@Lob
	private String content;
	private boolean isImportant;

	@Override
	public void init(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		this.ID = (String) parameters.get("ID");
		this.content = (String) parameters.get("content");
		this.isImportant = Boolean.parseBoolean((String) parameters
				.get("isImportant"));
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isImportant() {
		return isImportant;
	}

	public void setImportant(boolean isImportant) {
		this.isImportant = isImportant;
	}

	@Override
	public Map<String, Object> toRepresentation() {
		// TODO Auto-generated method stub
		Map<String, Object> representation = new HashMap<>();

		representation.put("content", this.content);
		representation.put("isImportant", this.isImportant);
		return representation;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		this.enabled = false;
	}

}
