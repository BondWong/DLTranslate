package service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import utils.JsonUtil;

/**
 * Servlet implementation class ImageUploader
 */
@WebServlet("/DLT/uploadImage")
public class ImageUploader extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final long MAXIMUMFILESIZE = 1024 * 1024 * 10 * 3;

	private static String root;
	private DiskFileItemFactory factory;
	private ServletFileUpload upload;

	public ImageUploader() {
		super();
	}

	public void init() {
		try {
			setUp();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart) {
				throw new FileUploadBase.InvalidContentTypeException();
			}

			List<String> links = process(request);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.setStatus(200);
			System.out.println("about to write back:" + JsonUtil.toJson(links));
			response.getWriter().write(JsonUtil.toJson(links));
			response.flushBuffer();

		} catch (FileUploadBase.InvalidContentTypeException icte) {
			icte.printStackTrace();
			response.sendError(406);
		} catch (FileUploadBase.FileSizeLimitExceededException fsle) {
			fsle.printStackTrace();
			response.sendError(413);
		} catch (FileUploadException fue) {
			fue.printStackTrace();
			response.sendError(400);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

	private void setUp() throws IOException {
		factory = new DiskFileItemFactory();
		File repository = (File) this.getServletContext().getAttribute(
				"javax.servlet.context.tempdir");
		factory.setRepository(repository);
		upload = new ServletFileUpload(factory);
		upload.setSizeMax(MAXIMUMFILESIZE);
		root = getServletConfig().getServletContext().getRealPath("/")
				+ "images/uploadedImages";
		if (!Files.exists(Paths.get(root)))
			Files.createDirectory(Paths.get(root));
	}

	private List<String> process(HttpServletRequest request)
			throws FileUploadException,
			FileUploadBase.FileSizeLimitExceededException, Exception {
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		List<String> links = new ArrayList<String>();

		while (iter.hasNext()) {
			FileItem item = iter.next();
			if (item.getName().equals("")) {
				links.add("");
			} else {
				File uploaddedFile = new File(root + item.getName());
				item.write(uploaddedFile);
				links.add(root + item.getName());
			}
		}

		return links;
	}
}
