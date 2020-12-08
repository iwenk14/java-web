<%-- 
    Document   : reportPetugas
    Created on : 12 Apr 15, 10:26:02
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<%@page import="java.sql.*" %>
 <%@page import="java.io.*" %>
 <html>
 <head>
 <title>Report Pasien</title>
 </head>
 <body>
 <h3>Sistem Informasi Manajemen Klinik dr. Maulana</h3>
 <h2>Laporan Data Petugas</h2>
 <%
 try {
 
//deklarasi url database
 String url = "jdbc:mysql://localhost:3306/sik";
 Connection con = null;
 Statement stat = null;
 ResultSet rs = null;
 
//load jdbc driver
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 
con = DriverManager.getConnection(url, "root", "");
 
stat = con.createStatement();
 
//membuat query
 String query = "SELECT * from petugas";
 
rs = stat.executeQuery(query);
 
%>


	<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "Petugas.xls");

		}
	%>
 <table border="1">
 <tr>
 <th>NIP Petugas</th>
 <th>Nama Petugas</th>
 <th>Alamat Petuagas</th>
 <th>Jenis Kelamin</th>
 <th>Tanggal Lahir</th>
 <th>No Telp</th>
 <th>Jabatan</th>
 <th>No Ijin Praktek</th>
 <th>Password</th>
 </tr>
 <% while (rs.next())
 {
 %>
 <tr>
 <td><%=rs.getString(1)%></td>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 <td><%=rs.getString(4)%></td>
 <td><%=rs.getString(5)%></td>
 <td><%=rs.getString(6)%></td>
 <td><%=rs.getString(7)%></td>
 <td><%=rs.getString(8)%></td>
 <td><%=rs.getString(9)%></td>
 </tr>
 
<%
 }
 %>
 <%
 
//menutup koneksi
 rs.close();
 stat.close();
 con.close();
 }
 catch (Exception ex)
 {
 out.println ("Unable to connect to database");
 }
 %>
 </table>
 </body>
 </html>
