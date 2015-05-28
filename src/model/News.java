package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Access(AccessType.FIELD)
@NamedQueries(value = {
		@NamedQuery(name = "News.fetchTuples", query = "SELECT n.publishDate, n.title, n.ID FROM News n WHERE n.enabled = 1 ORDER BY n.publishDateTime DESC"),
		@NamedQuery(name = "News.fetch", query = "SELECT n FROM News n WHERE n.enabled = 1 ORDER BY n.publishDateTime DESC"),
		@NamedQuery(name = "News.fetchByDate", query = "SELECT n FROM News n WHERE n.enabled = 1 AND n.publishDate = ?1") })
public class News extends Model {
	private String title;
	@Lob
	@ElementCollection(fetch = FetchType.EAGER)
	@OrderColumn
	private List<String> imageLinks;
	@Temporal(TemporalType.DATE)
	private Date publishDate;
	@Temporal(TemporalType.TIME)
	private Date publishTime;
	@Temporal(TemporalType.TIMESTAMP)
	private Date publishDateTime;
	@Lob
	private String content;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@OrderColumn
	private List<Comment> comments;

	@Override
	public void init(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		this.ID = System.currentTimeMillis() + "";
		this.title = (String) parameters.get("title");
		this.content = (String) parameters.get("content");
		publishDate = new Date();
		publishTime = new Date();
		publishDateTime = new Date();
		imageLinks = new ArrayList<>();
		comments = new ArrayList<>();
	}

	public String getID() {
		return this.ID;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setImageLinks(List<String> imageLinks) {
		this.imageLinks = imageLinks;
	}

	public void addImageLink(String imageLink) {
		this.imageLinks.add(imageLink);
	}

	public void removeImageLink(String imageLink) {
		this.imageLinks.remove(imageLink);
	}

	public void replaceImageLink(String oldImageLink, String newImageLink) {
		int index = imageLinks.indexOf(oldImageLink);
		imageLinks.remove(index);
		imageLinks.add(index, newImageLink);
	}

	public void clearImageLinks() {
		this.imageLinks.clear();
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void addComment(Comment comment) {
		this.comments.add(comment);
	}

	public void removeComment(Comment comment) {
		this.comments.remove(comment);
	}

	public void clearComments() {
		this.comments.clear();
	}

	public boolean equals(Object object) {
		if (object instanceof News) {
			News other = (News) object;
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
		representation.put("title", this.title);
		representation.put("imageLinks", this.imageLinks);
		representation.put("publishDate", this.publishDate);
		representation.put("publishTime", this.publishTime);
		representation.put("commentQuantity", comments.size());
		representation.put("content", this.content);

		List<Map<String, Object>> comments = new ArrayList<>();
		for (Comment comment : this.comments)
			comments.add(comment.toRepresentation());
		representation.put("comments", comments);

		return representation;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		this.enabled = false;

		for (Comment comment : this.comments)
			comment.delete();
	}

}
