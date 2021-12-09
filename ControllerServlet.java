package src;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Control Servlet", value = "/control-servlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> queryParams = req.getParameterMap();

        if (queryParams.containsKey("x") && queryParams.containsKey("y") && queryParams.containsKey("r"))
            req.getRequestDispatcher("/area-check").forward(req, resp);
        else if (queryParams.containsKey("clear"))
            req.getRequestDispatcher("/reset-servlet").forward(req, resp);
        else req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}