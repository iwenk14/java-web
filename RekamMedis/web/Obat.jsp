<font color="white"> <h2> .: [Data Obat] :. </h2> </font>
<div id="content"><table border="0" width="50%">
    <tr>
        <td valign='top'>
        <form action="sedObat" method="post"> 
        <input type="hidden" name="aksi" value="${param.aksi}"/>  
        <tr> 
            <td>Kode Obat</td> <td>: <input type="text" name="kd_obat" value="${param.kd_obat}"/></td>
        </tr>
        <tr>
            <td>Nama Obat</td> <td>: <input type="text" name="nm_obat" value="${param.nm_obat}"/></td>
        </tr>
        <tr>
            <td>Harga Obat</td> <td>: <input type="text" name="harga" value="${param.harga}"/></td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td> <td> </td>
        </tr>
        </form>
        </td></tr></table><br>
<form action="" method="post">    
    Cari Data Obat : <input type="text" name="cari" value="${param.cari}"/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="queryobat" dataSource="${dataSource}">
    SELECT * from obat where kd_obat like '%${param.cari}%' or
    nm_obat like '%${param.cari}%' or harga like '%${param.cari}%'
</sql:query>

	
        
    <br><table border="1" width="70%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>Kode Obat</td><td>Nama Obat</td><td>Harga</td><td>Action</td>
        </tr>
        <c:forEach var="rowobat" items="${queryobat.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowobat[0]}</td>
                <td valign='top'>${rowobat[1]}</td>
                <td valign='top'>${rowobat[2]}</td>
                <td valign='top'><a href='sedObat?aksi=HAPUS&kd_obat=${rowobat[0]}'> Hapus</a>  |
                                <a href='Beranda.jsp?halaman=Obat&aksi=GANTI&kd_obat=${rowobat[0]}&nm_obat=${rowobat[1]}&harga=${rowobat[2]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>  
           <br>   
           <a href="reportObat.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
</div>

