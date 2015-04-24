package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import model.Message;
import transaction.Transaction;
import transaction.create.CreateMessageTransaction;
import transaction.delete.DeleteModelTransaction;
import transaction.read.FetchMessageTuplesTransaction;
import transaction.read.GetModelByIDTransaction;

@Path("/message")
public class MessageService {
	private Transaction transaction;

	@SuppressWarnings({ "rawtypes" })
	@Path("create")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response create(Map param) throws Exception {
		transaction = new CreateMessageTransaction();
		try {
			transaction.execute(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return Response.ok().build();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Path("get/{ID: \\d+}")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	public Response get(@PathParam("ID") String ID) throws Exception {
		Map param = new HashMap();
		param.put("ID", ID);
		param.put("type", Message.class);
		transaction = new GetModelByIDTransaction();
		Map<String, Object> result;
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

	@SuppressWarnings("unchecked")
	@Path("fetchTuples")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchTuples() throws Exception {
		transaction = new FetchMessageTuplesTransaction();
		Map<Date, List<String>> results;
		try {
			results = (Map<Date, List<String>>) transaction.execute(null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return Response.ok(new GenericEntity<Map<Date, List<String>>>(results) {
		}).build();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Path("delete/{ID: \\d+}")
	@PUT
	public Response delete(@PathParam("ID") String ID) throws Exception {
		transaction = new DeleteModelTransaction();
		Map param = new HashMap();
		param.put("ID", ID);
		param.put("type", Message.class);
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
