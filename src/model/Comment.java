package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Access(AccessType.FIELD)
public class Comment extends Model {
	private String commentorName;
	@Temporal(TemporalType.TIMESTAMP)
	private Date publishDate;
	private String content;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@OrderColumn
	private List<Comment> replies;

	@Override
	public void init(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		this.ID = System.currentTimeMillis() + "";
		commentorName = (String) parameters.get("commentorName");
		publishDate = new Date();
		content = (String) parameters.get("content");
		replies = new ArrayList<>();
		this.enabled = true;
	}

	public void addReply(Comment comment) {
		this.replies.add(comment);
	}

	public void removeReply(Comment comment) {
		this.replies.remove(comment);
	}

	public void clearReplies() {
		this.replies.clear();
	}

	public boolean equals(Object object) {
		if (object instanceof Comment) {
			Comment other = (Comment) object;
			if (other.ID.equals(this.ID))
				return true;
		}
		return false;
	}

	public int hashCode() {
		return this.ID.hashCode();
	}

	@Override
	public Map<String, Object> toRepresentation() {
		// TODO Auto-generated method stub
		Map<String, Object> representation = new HashMap<>();
		representation.put("ID", this.ID);
		representation.put("commentorName", this.commentorName);
		representation.put("content", this.content);
		representation.put("publishDate", this.publishDate);
		List<Map<String, Object>> replies = new ArrayList<>();
		for (Comment reply : this.replies)
			replies.add(reply.toRepresentation());
		representation.put("replies", replies);
		return representation;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		this.enabled = false;
		for (Comment comment : this.replies)
			comment.delete();
	}

}
