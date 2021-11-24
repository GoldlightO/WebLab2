package src;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Reset Servlet", value = "/reset-servlet")
public class Reset extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        req.getSession().setAttribute(AreaCheckServlet.ATTRIBUTE_POINTS, null);
    }
}