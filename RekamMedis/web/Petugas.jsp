<font color="white"> <h2> .: [Data Petugas] :. </h2> </font>
    <table border="0" width="90%">
    <tr>
    <td valign='top'>
    <form action="sedPetugas" method="post">
    <input type="hidden" name="aksi" value="${param.aksi}"/>
    <tr>
            <td>NIP Petugas</td> <td>: <input type="text" name="nip" value="${param.nip}"/></td>
            <td>Tanggal Lahir</td> <td>: <input type="text" name="tgl_lahir" value="${param.tgl_lahir}"/></td>
        </tr>
        <tr>
            <td>Nama Petugas</td> <td>: <input type="text" name="nm_ptg" value="${param.nm_ptg}"/></td>
            <td>No Telp</td> <td>: <input type="text" name="no_telp" value="${param.no_telp}"/></td>
        </tr>    
        <tr>  
            <td>Alamat Petugas</td> <td>: <input type="text" name="alm_ptg" value="${param.alm_ptg}"/></td> 
            <td>Jabatan</td> <td>:  <select name="jabatan">
                                            <option value="Dokter"> Dokter </option>
                                            <option value="Admin"> Admin </option>
                                            <option value="Perawat"> Perawat </option>
                                            <option value="Lab"> Lab </option>
                                            <option value="Farmasi"> Farmasi </option>
                                         </select></td>
        </tr>   
        <tr>   
            <td>No Ijin Prakter</td> <td>: <input type="text" name="no_ijin_praktek" value="${param.no_ijin_praktek}"/></td>
            <td>Jenis Kelamin</td> <td>: <input type="radio" name="jk" value="Laki-laki"/> Laki-Laki
                                         <input type="radio" name="jk" value="Perempuan"/> Perempuan</td>
        </tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td><td></td>
            <td>Password</td> <td>: <input type="text" name="pass" value="${param.pass}"/></td>
        </tr>
        <tr>
            <td></></td> <td> </td>
        </tr>
    </form>
    </td>
    </tr>
    </table><br>
<form action="" method="post">    
    Cari Data Petugas : <input type="text" name="cari" value="${param.cari}"/>
           <input type="submit" value=" Cari " class="button"/> <br>
</form>
<sql:query var="querypetugas" dataSource="${dataSource}">
    SELECT * from petugas where nip like '%${param.cari}%' or
    nm_ptg like '%${param.cari}%' or alm_ptg like '%${param.cari}%' or
    jk like '%${param.cari}%' or tgl_lahir like '%${param.cari}%' or
    no_telp like '%${param.cari}%' or jabatan like '%${param.cari}%' or
    no_ijin_praktek like '%${param.cari}%' or pass like '%${param.cari}%'
</sql:query>
    <br><table border="1" width="90%" cellpadding="0" cellspacing="0">
        <tr class="head">
            <td>NIP Petugas</td><td>Nama Petugas</td><td>Alamat</td><td>Jenis Kel</td><td>Tanggal Lahir</td>
            <td>No Telp</td><td>Jabatan</td><td>No Ijin Praktek</td><td>Password</td><td>Action</td>
        </tr>
        <c:forEach var="rowpetugas" items="${querypetugas.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowpetugas[0]}</td>
                <td valign='top'>${rowpetugas[1]}</td>
                <td valign='top'>${rowpetugas[2]}</td>
                <td valign='top'>${rowpetugas[3]}</td>
                <td valign='top'>${rowpetugas[4]}</td>
                <td valign='top'>${rowpetugas[5]}</td>
                <td valign='top'>${rowpetugas[6]}</td>
                <td valign='top'>${rowpetugas[7]}</td>
                <td valign='top'>${rowpetugas[8]}</td>
                <td valign='top'><a href='sedPetugas?aksi=HAPUS&nip=${rowpetugas[0]}'> Hapus</a> |
                                <a href='Beranda.jsp?halaman=Petugas&aksi=GANTI&nip=${rowpetugas[0]}&nm_ptg=${rowpetugas[1]}&alm_ptg=${rowpetugas[2]}&jk=${rowpetugas[3]}&tgl_lahir=${rowpetugas[4]}&no_telp=${rowpetugas[5]}&jabatan=${rowpetugas[6]}&no_ijin_praktek=${rowpetugas[7]}&pass=${rowpetugas[8]}'> Edit </a>
                                </td>
            </tr>
        </c:forEach>
    </table>
           <br>   
           <a href="reportPetugas.jsp?exportToExcel=YES"  width="5%" class="buttonlap">Laporan Excel</a> <br>
           <br>