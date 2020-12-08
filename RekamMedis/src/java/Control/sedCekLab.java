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
public class sedCekLab extends HttpServlet {

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
            String nip=request.getParameter("nip");
            String nm_ceklab=request.getParameter("nm_ceklab");
            String hasil_cek=request.getParameter("hasil_cek");
            String ket=request.getParameter("ket");
            String harga=request.getParameter("harga");
            String no_laylab=request.getParameter("no_laylab");
            Class.forName("com.mysql.jdbc.Driver");
            Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into lab "+
                    "values('"+no_klinik+"','"+nip+"','"+nm_ceklab+"','"+hasil_cek+"','"+ket+"','"+harga+"','"+no_laylab+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from lab where no_laylab='"+no_laylab+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update lab set no_klinik='"+no_klinik+"',nip='"+nip+"',nm_ceklab='"+nm_ceklab+"',hasil_cek='"+hasil_cek+"',ket='"+ket+"',harga='"+harga+"' where no_laylab='"+no_laylab+"'");
            }
            out.println("Data Cek Laboratorium berhasil diproses.... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=CekLab&aksi=SIMPAN'/>");
        } catch(Exception e){            
            out.println("Gagal... Kemungkinan No Klinik dan Nama Cek Lab sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=CekLab&aksi=SIMPAN'/>");
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
