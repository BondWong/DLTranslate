package model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Access(AccessType.FIELD)
@NamedQueries(value = { @NamedQuery(name = "Message.fetchTuples", query = "SELECT m.submittedDate, m FROM Message m WHERE m.enabled = 1 ORDER BY m.submittedDate DESC") })
public class Message extends Model {
	private String name;
	private String email;
	private String topic;
	@Lob
	private String content;
	@Temporal(TemporalType.DATE)
	private Date submittedDate;

	@Override
	public void init(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		name = (String) parameters.get("name");
		email = (String) parameters.get("email");
		topic = (String) parameters.get("topic");
		content = (String) parameters.get("message");
		submittedDate = new Date();
		this.ID = System.currentTimeMillis() + "";
	}

	@Override
	public Map<String, Object> toRepresentation() {
		// TODO Auto-generated method stub
		Map<String, Object> representation = new HashMap<>();
		representation.put("ID", ID);
		representation.put("submitted", this.submittedDate);
		representation.put("name", name);
		representation.put("email", email);
		representation.put("topic", topic);
		representation.put("content", content);
		return representation;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		this.enabled = false;
	}
}
