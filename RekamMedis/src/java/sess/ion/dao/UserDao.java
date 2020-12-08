package sess.ion.dao;

import java.sql.*;
import sess.ion.util.*;
import sess.ion.bean.*;

public class UserDao {

    private ConMan conn = new ConMan();

    public String cek(User user) {
        String Hasil = "0";
        Connection conDB = null;
        try {
            conDB = conn.logOn();
            String query = "SELECT * from admin where username=? and password=?";
            PreparedStatement st = conDB.prepareStatement(query);
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
           
            try {
                ResultSet rs =    st.executeQuery();
                if (rs.next()) {
                Hasil = "1";
                }
            } catch (SQLException e) {
                System.out.println("Error " + e.getMessage());
                Hasil = "0";
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
            Hasil = "0";
        }
        return Hasil;
    }
}
