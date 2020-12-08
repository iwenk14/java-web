<%-- 
    Document   : reportPemeriksaan
    Created on : 12 Apr 15, 11:21:26
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
 <h2>Laporan Data Pemeriksaan</h2>
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
 String query = "SELECT pemeriksaan.no_rawat, pasien.nm_pasien, petugas.nm_ptg, obat.nm_obat, pemeriksaan.diagnosa, pemeriksaan.brt_badan, pemeriksaan.tensi, pemeriksaan.suhu_tubuh, pemeriksaan.ket from pemeriksaan inner join pasien on pemeriksaan.no_klinik=pasien.no_klinik inner join petugas on pemeriksaan.nip=petugas.nip inner join obat on pemeriksaan.kd_obat=obat.kd_obat ";
 
rs = stat.executeQuery(query);
 
%>


	<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "Pemeriksaan.xls");

		}
	%>
 <table border="1">
 <tr>
 <th>No Rawat</th>
 <th>Nama Pasien</th>
 <th>Nama Dokter</th>
 <th>Nama Obat</th>
 <th>Diagnosa</th>
 <th>Berat Badan</th>
 <th>Tensi</th>
 <th>Suhu Tubuh</th>
 <th>Keterangan</th>
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
