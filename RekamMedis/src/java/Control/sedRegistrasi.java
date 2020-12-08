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
public class sedRegistrasi extends HttpServlet {

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
            String no_reg=request.getParameter("no_reg");
            String no_klinik=request.getParameter("no_klinik");
            String tgl_reg=request.getParameter("tgl_reg");
            String jam_reg=request.getParameter("jam_reg");
            String cari=request.getParameter("cari");
                Class.forName("com.mysql.jdbc.Driver");
                Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into registrasi "+
                    "values('"+no_reg+"','"+no_klinik+"',current_date,current_time)");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from registrasi where no_reg='"+no_reg+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update registrasi set no_klinik='"+no_klinik+"' where no_reg='"+no_reg+"'");
            }
            out.println("Data Registrasi berhasil diproses... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Registrasi&aksi=SIMPAN'/>");
        } catch(Exception e) {            
            out.println("Gagal... Kemungkinan No Registrasi sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Registrasi&aksi=SIMPAN'/>");
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
