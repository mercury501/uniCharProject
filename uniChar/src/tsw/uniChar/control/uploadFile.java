package tsw.uniChar.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

/**
 * Servlet implementation class uploadFile
 */
@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class uploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        

		ArrayList<String> allowedExtensions = new ArrayList<String>() {
			{
				add(".jpg");
				add(".jpeg");
				add(".png");
				}
			};
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		String extension = fileName.substring(fileName.indexOf('.'));
		
		try {
			if (!allowedExtensions.contains(extension))
				throw new Exception("Estensione file invalida.");
			
			String role = (String)request.getSession().getAttribute("role");
			if (role == null || !role.equalsIgnoreCase("admin"))
				throw new Exception("Solo gli admin possono uploadare file.");
			
				
			for (Part part : request.getParts()) {
				part.write(getServletContext().getRealPath("/images/products/" + fileName));
				System.out.println(getServletContext().getRealPath("/images/products/" + fileName));
			}
			out.print("Upload effettuato.");
			out.flush();
			
		} catch (Exception e) {
			out.print(e.getMessage());
			out.flush();
		}
		
	}

}
