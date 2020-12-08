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
public class sedPemeriksaan extends HttpServlet {

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
            String no_rawat=request.getParameter("no_rawat");
            String no_klinik=request.getParameter("no_klinik");
            String nip=request.getParameter("nip");
            String kd_obat=request.getParameter("kd_obat");
            String diagnosa=request.getParameter("diagnosa");
            String brt_badan=request.getParameter("brt_badan");
            String tensi=request.getParameter("tensi");
            String suhu_tubuh=request.getParameter("suhu_tubuh");
            String ket=request.getParameter("ket");
            Class.forName("com.mysql.jdbc.Driver");
            Connection koneksi=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/sik","root","");
            if(aksi.equals("SIMPAN")){
                koneksi.createStatement().execute("insert into pemeriksaan "+
                    "values('"+no_rawat+"','"+no_klinik+"','"+nip+"','"+kd_obat+"','"+diagnosa+"','"+brt_badan+"','"+tensi+"','"+suhu_tubuh+"','"+ket+"')");
            }else if(aksi.equals("HAPUS")){
                koneksi.createStatement().execute(
                    "delete from pemeriksaan where no_rawat='"+no_rawat+"'");
            }else if(aksi.equals("GANTI")){
                koneksi.createStatement().execute(
                    "update pemeriksaan set no_klinik='"+no_klinik+"',nip='"+nip+"',kd_obat='"+kd_obat+"',diagnosa='"+diagnosa+"',brt_badan='"+brt_badan+"',tensi='"+tensi+"',suhu_tubuh='"+suhu_tubuh+"',ket='"+ket+"' where no_rawat='"+no_rawat+"'");
            }
            out.println("Data Pemeriksaan berhasil diproses.... <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pemeriksaan&aksi=SIMPAN'/>");
        } catch(Exception e){            
            out.println("Gagal... Kemungkinan No Rawat sudah ada, Silahkan Ulangi!!! <meta http-equiv='refresh' "+
                    "content='1;Beranda.jsp?halaman=Pemeriksaan&aksi=SIMPAN'/>");
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
