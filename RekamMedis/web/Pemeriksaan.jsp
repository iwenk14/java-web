<font color="white"> <h2> .: [Data Pemeriksaan] :. </h2> </font>
<div id="content">
    <table border="0" width="100%">
    <tr>
    <td valign='top'>
    <form action="sedPemeriksaan" method="post">
        <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>No Rawat</td> <td>: <input type="text" name="no_rawat" value="${param.no_rawat}"/></td>
            <td>Diagnosa</td> <td>: <input type="text" name="diagnosa" value="${param.diagnosa}"/></td>
        </tr>
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

            <td>Berat Badan</td> <td>: <input type="text" name="brt_badan" value="${param.brt_badan}"/></td>
        </tr>    
        <tr>    
            <td>Nama Dokter</td><td>: 
                 <select name="nip">
                 <sql:query var="querypetugas" dataSource="${dataSource}">
                      SELECT nip, nm_ptg from petugas where jabatan='Dokter'
                 </sql:query>
                         <c:forEach var="rowpetugas" items="${querypetugas.rowsByIndex}">
                                   <option value="${rowpetugas[0]}">${rowpetugas[1]}</option>
                         </c:forEach>
                 </select>

            </td>
            <td>Tensi</td> <td>: <input type="text" name="tensi" value="${param.tensi}"/></td>
        </tr>    
        <tr>       
            <td>Nama Obat</td><td>: 
                 <select name="kd_obat">
                 <sql:query var="queryobat" dataSource="${dataSource}">
                      SELECT kd_obat, nm_obat from obat
                 </sql:query>
                         <c:forEach var="rowobat" items="${queryobat.rowsByIndex}">
                                   <option value="${rowobat[0]}">${rowobat[1]}</option>
                         </c:forEach>
                 </select>
            </td> 
            <td>Suhu Tubuh</td> <td>: <input type="text" name="suhu_tubuh" value="${param.suhu_tubuh}"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td><td></td>
            <td>Keterangan</td> <td>: <input type="text" name="ket" value="${param.ket}"/></td>
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Pemeriksaan : <input type="text" name="cari" value=""/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querypemeriksaan" dataSource="${dataSource}">
    SELECT pemeriksaan.no_rawat, pasien.nm_pasien, petugas.nm_ptg, obat.nm_obat, pemeriksaan.diagnosa, 
    pemeriksaan.brt_badan, pemeriksaan.tensi, pemeriksaan.suhu_tubuh, pemeriksaan.ket from pemeriksaan 
    inner join pasien on pemeriksaan.no_klinik=pasien.no_klinik inner join petugas on pemeriksaan.nip=petugas.nip 
    inner join obat on pemeriksaan.kd_obat=obat.kd_obat where pemeriksaan.no_rawat like '%${param.cari}%' or
    pasien.nm_pasien like '%${param.cari}%' or petugas.nm_ptg like '%${param.cari}%' or
    obat.kd_obat like '%${param.cari}%' or pemeriksaan.diagnosa like '%${param.cari}%' or
    pemeriksaan.brt_badan like '%${param.cari}%' or pemeriksaan.tensi like '%${param.cari}%' or
    pemeriksaan.suhu_tubuh like '%${param.cari}%' or pemeriksaan.ket like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>No Rawat</td><td>Nama Pasien</td><td>Nama Dokter</td><td>Nama Obat</td><td>Diagnosa</td>
            <td>Berat Badan</td><td>Tensi</td><td>Suhu Tubuh</td><td>Keterangan</td><td>Action</td>
        </tr>
        <c:forEach var="rowpemeriksaan" items="${querypemeriksaan.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowpemeriksaan[0]}</td>
                <td valign='top'>${rowpemeriksaan[1]}</td>
                <td valign='top'>${rowpemeriksaan[2]}</td>
                <td valign='top'>${rowpemeriksaan[3]}</td>
                <td valign='top'>${rowpemeriksaan[4]}</td>
                <td valign='top'>${rowpemeriksaan[5]}</td>
                <td valign='top'>${rowpemeriksaan[6]}</td>
                <td valign='top'>${rowpemeriksaan[7]}</td>
                <td valign='top'>${rowpemeriksaan[8]}</td>
                <td valign='top'><a href='sedPemeriksaan?aksi=HAPUS&no_rawat=${rowpemeriksaan[0]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=Pemeriksaan&aksi=GANTI&no_rawat=${rowpemeriksaan[0]}&no_klinik=${rowpemeriksaan[1]}&nip=${rowpemeriksaan[2]}&kd_obat=${rowpemeriksaan[3]}&diagnosa=${rowpemeriksaan[4]}&brt_badan=${rowpemeriksaan[5]}&tensi=${rowpemeriksaan[6]}&suhu_tubuh=${rowpemeriksaan[7]}&ket=${rowpemeriksaan[8]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportPemeriksaan.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
</div> 