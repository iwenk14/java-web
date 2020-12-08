<font color="white"> <h2> .: [Data Cek Laboratorium] :. </h2> </font><br>
    <table border="0" width="80%">
    <tr>
    <td valign='top'>
    <form action="sedCekLab" method="post">
    <input type="hidden" name="aksi" value="${param.aksi}"/>
    <tr>
            <td>Nama Pasien</td> <td>:
                 <sql:query var="querypasien" dataSource="${dataSource}">
                      SELECT no_klinik, nm_pasien from pasien
                 </sql:query> 
                 <select name="no_klinik">
                         <c:forEach var="rowpasien" items="${querypasien.rowsByIndex}">
                                   <option value="${rowpasien[0]}">${rowpasien[1]}</option>
                         </c:forEach>
                 </select>
            <td>Hasil</td> <td>: <input type="text" name="hasil_cek" value="${param.hasil_cek}"/></td>
        </tr>
        <tr>
            <td>Nama Petugas</td> <td>: 
                 <select name="nip">
                 <sql:query var="querypetugas" dataSource="${dataSource}">
                      SELECT nip, nm_ptg from petugas where jabatan='Lab'
                 </sql:query>
                         <c:forEach var="rowpetugas" items="${querypetugas.rowsByIndex}">
                                   <option value="${rowpetugas[0]}">${rowpetugas[1]}</option>
                         </c:forEach>
                 </select>
            <td>Keterangan</td> <td>: <input type="text" name="ket" value="${param.ket}"/></td>
        </tr>    
        <tr> 
            <td>Jenis Cek Lab</td> <td>:  <select name="nm_ceklab">
                                            <option value="Cek Darah"> Cek Darah </option>
                                            <option value="Cek Urin"> Cek Urin </option>
                                            <option value="Lainnya"> Lainnya </option>
                                         </select></td>
            <td>Harga</td> <td>: <input type="text" name="harga" value="${param.harga}"/></td> 
        </tr> 
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td><td></td>
            <td>No Layanan Lab</td> <td>: <input type="text" name="no_laylab" value="${param.no_laylab}"/></td> 
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Cek Lab : <input type="text" name="cari" value="${param.cari}"/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querylab" dataSource="${dataSource}">
    SELECT pasien.nm_pasien, petugas.nm_ptg, lab.nm_ceklab, lab.hasil_cek, 
    lab.ket, lab.harga, lab.no_laylab from lab inner join pasien on lab.no_klinik=pasien.no_klinik
    inner join petugas on lab.nip=petugas.nip where pasien.nm_pasien like '%${param.cari}%' or
    petugas.nm_ptg like '%${param.cari}%' or lab.nm_ceklab like '%${param.cari}%' or
    lab.hasil_cek like '%${param.cari}%' or lab.ket like '%${param.cari}%' or
    lab.harga like '%${param.cari}%' or lab.no_laylab like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>Nama Pasien</td><td>Nama Petugas</td><td>Jenis Cek Lab</td>
            <td>Hasil</td><td>Keterangan</td><td>Harga</td><td>No Layanan Lab</td><td>Action</td>
        </tr>
        <c:forEach var="rowlab" items="${querylab.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowlab[0]}</td>
                <td valign='top'>${rowlab[1]}</td>
                <td valign='top'>${rowlab[2]}</td>
                <td valign='top'>${rowlab[3]}</td>
                <td valign='top'>${rowlab[4]}</td>
                <td valign='top'>${rowlab[5]}</td>
                <td valign='top'>${rowlab[6]}</td>
                <td valign='top'><a href='sedCekLab?aksi=HAPUS&no_laylab=${rowlab[6]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=CekLab&aksi=GANTI&no_klinik=${rowlab[0]}&nip=${rowlab[1]}&nm_ceklab=${rowlab[2]}&hasil_cek=${rowlab[3]}&ket=${rowlab[4]}&harga=${rowlab[5]}&no_laylab=${rowlab[6]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table> 
           <br>   
           <a href="reportCekLab.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
