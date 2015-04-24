package service;

import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import model.Comment;
import transaction.Transaction;
import transaction.create.CreateCommentTransaction;
import transaction.delete.DeleteModelTransaction;

@Path("comment")
public class CommentService {
	private Transaction transaction;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Path("create")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response create(Map param) throws Exception {
		transaction = new CreateCommentTransaction();
		Map<String, Object> result = new HashMap<>();
		try {
			result = (Map<String, Object>) transaction.execute(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return Response.ok(new GenericEntity<Map<String, Object>>(result) {
		}).build();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Path("delete/{ID: \\d+}")
	@PUT
	public Response delete(@PathParam("ID") String ID) throws Exception {
		Map param = new HashMap();
		param.put("ID", ID);
		param.put("type", Comment.class);
		transaction = new DeleteModelTransaction();
		try {
			transaction.execute(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return Response.ok().build();
	}
}
