/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sess.ion.test;

import sess.ion.bean.User;
import sess.ion.dao.UserDao;

/**
 *
 * @author HT 2010
 */
public class Main {

    public static void main(String args[]) {
        UserDao sd = new UserDao();
        User s = new User();
        String user = "admin";
        String password = "admin";

        s.setUsername(user);
        s.setPassword(password);
        System.out.println(sd.cek(s));
    }
}

