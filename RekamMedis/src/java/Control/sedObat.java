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
public class sedObat extends HttpServlet {

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
            String kd_obat=request.getParameter("kd_obat");
            String nm_obat=request.getParameter("nm_obat");
            String harga=request.getParameter("harga");
            String cari=request.getParameter("cari");
                Class.forName("com.mysql.jdbc.Driver");
                Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into obat "+
                    "values('"+kd_obat+"','"+nm_obat+"','"+harga+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from obat where kd_obat='"+kd_obat+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update obat set nm_obat='"+nm_obat+"',harga='"+harga+"' where kd_obat='"+kd_obat+"'");
            }
            out.println("Data Obat berhasil diproses... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Obat&aksi=SIMPAN'/>");
        } catch(Exception e) {            
            out.println("Gagal... Kemungkinan Kode Obat sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Obat&aksi=SIMPAN'/>");
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
