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
public class sedPembayaran extends HttpServlet {

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
            String kd_obat=request.getParameter("kd_obat");
            String no_klinik=request.getParameter("no_klinik");
            String tgl_byr=request.getParameter("tgl_byr");
            String tambahan=request.getParameter("tambahan");
            String tot_biaya=request.getParameter("tot_biaya");
            String nip=request.getParameter("nip");
            String no_nota=request.getParameter("no_nota");
            Class.forName("com.mysql.jdbc.Driver");
            Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into pembayaran "+
                    "values('"+kd_tnd+"','"+kd_obat+"','"+no_klinik+"',current_date,'"+tambahan+"','"+tot_biaya+"','"+nip+"','"+no_nota+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from pembayaran where no_nota='"+no_nota+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update pembayaran set kd_obat='"+kd_obat+"',no_klinik='"+no_klinik+"',tgl_byr='"+tgl_byr+"',tambahan='"+tambahan+"',tot_biaya='"+tot_biaya+"',nip='"+nip+"' where no_nota='"+no_nota+"'");
            }
            out.println("Data Pembayaran berhasil diproses.... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pembayaran&aksi=SIMPAN'/>");
        } catch(Exception e){            
            out.println("Gagal... Kemungkinan No Nota sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pembayaran&aksi=SIMPAN'/>");
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
