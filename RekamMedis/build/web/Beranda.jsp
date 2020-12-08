<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>  
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource"
                   driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/sik"
                   user="root" password="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SI Klinik</title>
<meta http-equiv="Content-Language" content="English" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
</head>
<body>

<div id="wrap">

<div id="header">
<h1><a href="#">Sistem Informasi Klinik Rawat Jalan</a></h1>
<h2>Klinik dr.Asril Semanan Kalideres</h2>
<h3>Programmer by. Irwansyah,S.Kom</h3>
</div>

<div id="menu">
<ul>
<li><a href="Beranda.jsp?halaman=Admin">Home</a></li>
<li><a href="Beranda.jsp?halaman=About">About</a></li>
<li><a href="logout.jsp">Logout</a></li>
</ul>
</div>

<div id="content">
<div class="right"> 
<table width="100%">
<tr>
<td valign="top" width="0%">
<td valign="top" width="110%">
            <c:choose>
                <c:when test="${param.halaman=='Obat'}">
                    <%@include file="Obat.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Petugas'}">
                    <%@include file="Petugas.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Pasien'}">
                    <%@include file="Pasien.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Tindakan'}">
                    <%@include file="Tindakan.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Registrasi'}">
                    <%@include file="Registrasi.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Pemeriksaan'}">
                    <%@include file="Pemeriksaan.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='CekLab'}">
                    <%@include file="CekLab.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='Pembayaran'}">
                    <%@include file="Pembayaran.jsp" %>
                </c:when>
                <c:when test="${param.halaman=='About'}">
                    <%@include file="About.jsp" %>
                </c:when>
                <c:otherwise>
                    <%@include file="Admin.jsp" %>
                </c:otherwise>
            </c:choose>
        </td>
</td> 
</tr>
</table>

<div class="footer">
Programmer by <a href="http://www.irwansyah.blogspot.com/">Coretan Java</a>, Thanks to <a href="http://www.free-css-templates.com/">Free CSS Templates</a>
</div>
</div>

<div class="left"> 

<h2>Master Data</h2>
<ul>
<li><a href="Beranda.jsp?halaman=Obat&aksi=SIMPAN">Obat</a></li> 
<li><a href="Beranda.jsp?halaman=Tindakan&aksi=SIMPAN">Tindakan</a></li>
<li><a href="Beranda.jsp?halaman=Pasien&aksi=SIMPAN">Pasien</a></li> 
<li><a href="Beranda.jsp?halaman=Petugas&aksi=SIMPAN">Petugas</a></li> 
</ul>

<h2>Transaksi</h2>
<ul>
<li><a href="Beranda.jsp?halaman=Registrasi&aksi=SIMPAN">Registrasi</a></li> 
<li><a href="Beranda.jsp?halaman=Pemeriksaan&aksi=SIMPAN">Pemeriksaan</a></li>
<li><a href="Beranda.jsp?halaman=CekLab&aksi=SIMPAN">Cek Lab</a></li>
<li><a href="Beranda.jsp?halaman=Pembayaran&aksi=SIMPAN">Pembayaran</a></li>
</ul>

</div>

</div>
<div style="clear: both;"> </div>


</div>

</body>
</html>
