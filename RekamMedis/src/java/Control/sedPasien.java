/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class sedPasien extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String aksi=request.getParameter("aksi");
            String no_klinik=request.getParameter("no_klinik");
            String nm_pasien=request.getParameter("nm_pasien");
            String alm_pasien=request.getParameter("alm_pasien");
            String jk=request.getParameter("jk");
            String tgl_lahir=request.getParameter("tgl_lahir");
            String no_telp=request.getParameter("no_telp");
            String umur=request.getParameter("umur");
            Class.forName("com.mysql.jdbc.Driver");
            Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into pasien "+
                    "values('"+no_klinik+"','"+nm_pasien+"','"+alm_pasien+"','"+jk+"','"+tgl_lahir+"','"+no_telp+"','"+umur+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from pasien where no_klinik='"+no_klinik+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update pasien set nm_pasien='"+nm_pasien+"',alm_pasien='"+alm_pasien+"',jk='"+jk+"',tgl_lahir='"+tgl_lahir+"',no_telp='"+no_telp+"',umur='"+umur+"' where no_klinik='"+no_klinik+"'");
            }
            out.println("Data Pasien berhasil diproses.... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pasien&aksi=SIMPAN'/>");
        } catch(Exception e){            
            out.println("Gagal... Kemungkinan NIP sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pasien&aksi=SIMPAN'/>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
