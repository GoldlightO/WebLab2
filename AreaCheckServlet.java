package src;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "Area Check Servlet", value = "/area-check")
public class AreaCheckServlet extends HttpServlet {
    public static final String ATTRIBUTE_POINTS = "points";
    private String message;

    public void init() {
        message = "ERROR!";
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        resp.setContentType("text/html");
        Point point = null;

        try {
            point = new Point(req);
        } catch (NumberFormatException e) {
            PrintWriter out = resp.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message + "</h1>");
            out.println("</body></html>");
            return ;
        }
        point.calc();

        Object objPoints = req.getSession().getAttribute(ATTRIBUTE_POINTS);
        if (objPoints == null) objPoints = new ArrayList<Point>();

        if (objPoints instanceof ArrayList) {
            ArrayList<Point> points = (ArrayList<Point>) objPoints;
            points.add(point);
            req.getSession().setAttribute(ATTRIBUTE_POINTS, points);
        }

        ServletOutputStream out = resp.getOutputStream();
        out.print(point.toJson());
        out.close();
    }
}