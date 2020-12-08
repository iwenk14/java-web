<font color="white"> <h2> .: [Data Tarif Tindakan] :. </h2> </font>
<div id="content"><table border="0" width="50%">
    <tr>
        <td valign='top'>
    <form action="sedTindakan" method="post">
    <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>Kode Tindakan</td> <td>: <input type="text" name="kd_tnd" value="${param.kd_tnd}"/></td>
        </tr>
        <tr>
            <td>Nama Tindakan</td> <td>: <input type="text" name="nm_tnd" value="${param.nm_tnd}"/></td>
        </tr>
        <tr>
            <td>Harga Tindakan</td> <td>: <input type="text" name="harga" value="${param.harga}"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td> <td></td>
        </tr>
        </form>
        </td></tr></table><br>
<form action="" method="post">    
    Cari Data Tarif Tindakan : <input type="text" name="cari" value=""/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querytindakan" dataSource="${dataSource}">
    SELECT * from tindakan where kd_tnd like '%${param.cari}%' or
    nm_tnd like '%${param.cari}%' or harga like '%${param.cari}%'
</sql:query>
<br><table border="1" width="70%">
        <tr class="head">
            <td>Kode Tindakan</td><td>Nama Tindakan</td><td>Tarif Tindakan</td><td>Action</td>
        </tr>
        <c:forEach var="rowtindakan" items="${querytindakan.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowtindakan[0]}</td>
                <td valign='top'>${rowtindakan[1]}</td>
                <td valign='top'>${rowtindakan[2]}</td>
                <td valign='top'><a href='sedTindakan?aksi=HAPUS&kd_tnd=${rowtindakan[0]}'> Hapus</a>  |
                                <a href='Beranda.jsp?halaman=Tindakan&aksi=GANTI&kd_tnd=${rowtindakan[0]}&nm_tnd=${rowtindakan[1]}&harga=${rowtindakan[2]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportTindakan.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
</div>
