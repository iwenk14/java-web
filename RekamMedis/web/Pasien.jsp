<font color="white"> <h2> .: [Data Pasien] :. </h2> </font>
<div id="content">
    <table border="0" width="90%">
    <tr>
    <td valign='top'>
    <form action="sedPasien" method="post">
    <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>No Klinik</td> <td>: <input type="text" name="no_klinik" value="${param.no_klinik}"/></td>
            <td>Jenis Kelamin</td> <td>: <input type="radio" name="jk" value="Laki-laki"/> Laki-Laki
                                         <input type="radio" name="jk" value="Perempuan"/> Perempuan</td>
        </tr>
        <tr>
            <td>Nama Pasien</td> <td>: <input type="text" name="nm_pasien" value="${param.nm_pasien}"/></td>
            <td>Tanggal Lahir</td> <td>: <input type="text" name="tgl_lahir" value="${param.tgl_lahir}"/></td>
        </tr>    
        <tr>    
            <td>Alamat Pasien</td> <td>: <input type="text" name="alm_pasien" value="${param.alm_pasien}"/></td>
            <td>No. Telp</td> <td>: <input type="text" name="no_telp" value="${param.no_telp}"/></td>
            
        </tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td><td></td>
            <td>Umur</td> <td>: <input type="text" name="umur" value="${param.umur}"/></td>
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Pasien : <input type="text" name="cari" value="${param.cari}"/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querypasien" dataSource="${dataSource}">
    SELECT * from pasien where no_klinik like '%${param.cari}%' or
    nm_pasien like '%${param.cari}%' or alm_pasien like '%${param.cari}%' or
    jk like '%${param.cari}%' or tgl_lahir like '%${param.cari}%' or
    no_telp like '%${param.cari}%' or umur like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>No Klinik</td><td>Nama Pasien</td><td>Alamat Pasien</td><td>Jenis Kelamin</td>
            <td>Tanggal Lahir</td><td>No Telp</td><td>Umur</td><td>Action</td>
        </tr>
        <c:forEach var="rowpasien" items="${querypasien.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowpasien[0]}</td>
                <td valign='top'>${rowpasien[1]}</td>
                <td valign='top'>${rowpasien[2]}</td>
                <td valign='top'>${rowpasien[3]}</td>
                <td valign='top'>${rowpasien[4]}</td>
                <td valign='top'>${rowpasien[5]}</td>
                <td valign='top'>${rowpasien[6]}</td>
                <td valign='top'><a href='sedPasien?aksi=HAPUS&no_klinik=${rowpasien[0]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=Pasien&aksi=GANTI&no_klinik=${rowpasien[0]}&nm_pasien=${rowpasien[1]}&alm_pasien=${rowpasien[2]}&jk=${rowpasien[3]}&tgl_lahir=${rowpasien[4]}&no_telp=${rowpasien[5]}&umur=${rowpasien[6]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportPasien.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
           </div>
