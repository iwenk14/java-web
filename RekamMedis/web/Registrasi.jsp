<font color="white"> <h2> .: [Data Registrasi Periksa] :. </h2> </font>
<div id="content">
    <table border="0" width="80%">
    <tr>
    <td valign='top'>
    <form action="sedRegistrasi" method="post">
        <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>No Registrasi</td> <td>: <input type="text" name="no_reg" value="${param.no_reg}"/></td>
            <td>Nama Pasien</td><td>: 
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
            <td><input type="submit" value="Simpan" class="button"/></td><td></td>
            <td></td> <td></td>
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Reg. Periksa : <input type="text" name="cari" value=""/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="queryreg" dataSource="${dataSource}">
    SELECT registrasi.no_reg, pasien.nm_pasien, registrasi.tgl_reg, registrasi.jam_reg 
    from registrasi inner join pasien on registrasi.no_klinik=pasien.no_klinik where 
    registrasi.no_reg like '%${param.cari}%' or pasien.nm_pasien like '%${param.cari}%' or 
    registrasi.tgl_reg like '%${param.cari}%' or registrasi.jam_reg like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>No Registrasi</td><td>Nama Pasien</td><td>Tanggal Registrasi</td>
            <td>Jam Registrasi</td><td>Action</td>
        </tr>
        <c:forEach var="rowreg" items="${queryreg.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowreg[0]}</td>
                <td valign='top'>${rowreg[1]}</td>
                <td valign='top'>${rowreg[2]}</td>
                <td valign='top'>${rowreg[3]}</td>
                <td valign='top'><a href='sedRegistrasi?aksi=HAPUS&no_reg=${rowreg[0]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=Registrasi&aksi=GANTI&no_reg=${rowreg[0]}&no_klinik=${rowreg[1]}&tgl_reg=${rowreg[2]}&jam_reg=${rowreg[3]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportReg.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>
</div>
