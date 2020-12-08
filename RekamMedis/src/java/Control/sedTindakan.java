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
public class sedTindakan extends HttpServlet {

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
            String kd_tnd=request.getParameter("kd_tnd");
            String nm_tnd=request.getParameter("nm_tnd");
            String harga=request.getParameter("harga");
                Class.forName("com.mysql.jdbc.Driver");
                Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into tindakan "+
                    "values('"+kd_tnd+"','"+nm_tnd+"','"+harga+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from tindakan where kd_tnd='"+kd_tnd+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update tindakan set nm_tnd='"+nm_tnd+"',harga='"+harga+"' where kd_tnd='"+kd_tnd+"'");
            }
            out.println("Data Tindakan berhasil diproses.... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Tindakan&aksi=SIMPAN'/>");
        } catch(Exception e) {                
            out.println("Gagal... Kemungkinan Kode Tindakan sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Tindakan&aksi=SIMPAN'/>");
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
