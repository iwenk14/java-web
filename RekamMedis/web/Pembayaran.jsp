<font color="white"> <h2> .: [Data Pembayaran] :. </h2> </font>
<div id="content">
    <table border="0" width="90%">
    <tr>
    <td valign='top'>
    <form action="sedPembayaran" method="post">
    <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>No Nota</td> <td>: 
                 <input type="text" width="15" name="no_nota" value="${param.no_nota}"/>
                 
            </td>
            <td>Nama Pasien</td> <td>: 
                 <sql:query var="querypasien" dataSource="${dataSource}">
                      SELECT no_klinik, nm_pasien from pasien
                 </sql:query> 
                 <select name="no_klinik">
                         <c:forEach var="rowpasien" items="${querypasien.rowsByIndex}">
                                   <option value="${rowpasien[0]}">${rowpasien[1]}</option>
                         </c:forEach>
                 </select>
            </td>
        </tr>
        <tr>
            <td>Harga Obat</td> <td>: 
                 <input type="text" width="15" name="kd_obat" value="${param.kd_obat}"/>
            </td>
            <td>Tambahan</td> <td>: <input type="text" name="tambahan" value="${param.tambahan}"/></td>
        </tr>    
        <tr>    
            <td><input type="submit" value="Simpan" class="button"/></td>
            <td>Harga Tindakan : 
                 <input type="text" width="15" name="kd_tnd" value="${param.kd_tnd}"/>
            <td>Nama Petugas</td> <td>: 
                 <select name="nip">
                 <sql:query var="querypetugas" dataSource="${dataSource}">
                      SELECT nip, nm_ptg from petugas where jabatan='Farmasi'
                 </sql:query>
                         <c:forEach var="rowpetugas" items="${querypetugas.rowsByIndex}">
                                   <option value="${rowpetugas[0]}">${rowpetugas[1]}</option>
                         </c:forEach>
                 </select>
            </td>
        </tr>
        <tr>
            <td></td> <td></td>
            <td>Total Biaya</td> <td>: <input type="text" name="tot_biaya" value="${param.tot_biaya}"/></td>
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Pembayaran : <input type="text" name="cari" value=""/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querypembayaran" dataSource="${dataSource}">
    SELECT pembayaran.kd_tnd, pembayaran.kd_obat, pasien.nm_pasien, pembayaran.tgl_byr, 
    pembayaran.tambahan, pembayaran.tot_biaya, petugas.nm_ptg, pembayaran.no_nota from pembayaran 
    inner join pasien on pembayaran.no_klinik=pasien.no_klinik 
    inner join petugas on pembayaran.nip=petugas.nip where pembayaran.kd_tnd like '%${param.cari}%' or
    pembayaran.kd_obat like '%${param.cari}%' or pasien.nm_pasien like '%${param.cari}%' or
    pembayaran.tgl_byr like '%${param.cari}%' or pembayaran.tambahan like '%${param.cari}%' or
    pembayaran.tot_biaya like '%${param.cari}%' or petugas.nm_ptg like '%${param.cari}%' or
    pembayaran.no_nota like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>Harga Tindakan</td><td>Harga Obat</td><td>Nama Pasien</td><td>Tanggal Bayar</td>
            <td>Tambahan</td><td>Total Biaya</td><td>Nama Petugas</td><td>No Nota</td><td>Action</td>
        </tr>
        <c:forEach var="rowpembayaran" items="${querypembayaran.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowpembayaran[0]}</td>
                <td valign='top'>${rowpembayaran[1]}</td>
                <td valign='top'>${rowpembayaran[2]}</td>
                <td valign='top'>${rowpembayaran[3]}</td>
                <td valign='top'>${rowpembayaran[4]}</td>
                <td valign='top'>${rowpembayaran[5]}</td>
                <td valign='top'>${rowpembayaran[6]}</td>
                <td valign='top'>${rowpembayaran[7]}</td>
                <td valign='top'><a href='sedPembayaran?aksi=HAPUS&no_nota=${rowpembayaran[7]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=Pembayaran&aksi=GANTI&kd_tnd=${rowpembayaran[0]}&kd_obat=${rowpembayaran[1]}&no_klinik=${rowpasien[1]}&tgl_byr=${rowpembayaran[3]}&tambahan=${rowpembayaran[4]}&tot_biaya=${rowpembayaran[5]}&nip=${rowpembayaran[6]}&no_nota=${rowpembayaran[7]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportPembayaran.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
           </div>
                                
