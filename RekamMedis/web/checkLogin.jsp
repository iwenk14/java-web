<%@page import="sess.ion.dao.UserDao"%>
<%@page import="sess.ion.bean.User"%>
<%
            UserDao sd = new UserDao();
            User s = new User();
            String user = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            s.setUsername(user);
            s.setPassword(password);
            String hasil = sd.cek(s);

            if (hasil == "1") {
                out.println(hasil);
                String sUserName = s.getUsername() + s.getPassword();
                out.println("Berhasil : " + sUserName);
                session.setAttribute("username", s.getUsername());
                response.sendRedirect("Beranda.jsp");
            } else {
                //out.println(hasil);
                //String sUserName = s.getUsername() + s.getPassword();
                //out.println("Gagal : " + sUserName);
                response.sendRedirect("index.jsp?errmsg=error");
            }
%>
