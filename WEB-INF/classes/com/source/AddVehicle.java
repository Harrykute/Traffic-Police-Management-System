package com.source;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.util.DbConnection;

/**
 * Servlet implementation class AddVehicle
 */
@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;

	
	public void init(ServletConfig config) throws ServletException 
	{
		try {

			con = DbConnection.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String drivingLicense=request.getParameter("drivingLicense");
		String vehicleNum=request.getParameter("vehicleNum");
		String model=request.getParameter("model");
		String year=request.getParameter("year");
		String vrn=request.getParameter("vrn");
		String vrd=request.getParameter("vrd");
		
		HttpSession session = request.getSession();
		
		System.out.println("Adding customer vehicle: "+drivingLicense+" "+vehicleNum +" "+model + " "+year+" "+vrn+" "+vrd);
		
		String filePath = "D://";

		
		try
		{
			String userId = (String)session.getAttribute("UserId");
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `user_vehicles` where vehicle_num='"+vehicleNum+"' OR vehicle_reg_num = '"+vrn+"'");
			ResultSet rs =ps1.executeQuery();
			if(!rs.next())
			{

				Map hintMap = new HashMap();
				hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

				AESAlgorithm AES = new AESAlgorithm();
				PasswordAthenticationProtocol RN = new PasswordAthenticationProtocol();
		
				String SecretKey = RN.generateRandomString();
				String pt = userId + drivingLicense + vehicleNum + model + year + vrd + vrn;
				String qrcode = AES.encrypt(pt, SecretKey);
				
				System.out.println("---Encrpted---" + qrcode);
				System.out.println(userId);
				System.out.println(session.getAttribute("name"));
				String qrname=(String)session.getAttribute("name");
				// int QRName = Integer.parseInt(GF.getLatestUserID())+1;

				String files = filePath + qrname + ".png";

				//QrGenerator QR = new QrGenerator();
				QrGenerator.createQRCode(qrcode, files, hintMap, 200, 200);

				
				ps=con.prepareStatement("INSERT INTO `user_vehicles`"
						+ "(`user_id`, `driving_license`, `vehicle_num`, `model`, `year`, `vehicle_reg_date`, `vehicle_reg_num`, `qr_code`, "
						+ "`stolen`, `status`) "
						+ "VALUES ('"+userId+"','"+drivingLicense+"','"+vehicleNum+"','"+model+"','"+year+"','"+vrd+"','"+vrn+"','"+qrcode+"','0','0')");
						
				int result=ps.executeUpdate();
				if(result>0)
				{
					System.out.println("CustomerVehicle Successfully");
					
					response.sendRedirect("CustomerVehicle.jsp?success");
				}
				else 
				{
					System.out.println("CustomerVehicle add failed");
					response.sendRedirect("CustomerVehicle.jsp?failure");
				}
			}
			else{
				System.out.println("CustomerVehicle already exists. ");
				response.sendRedirect("CustomerVehicle.jsp?alreadyExist");
				
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception Occure:- "+e);
		}
		

	
	}

}
