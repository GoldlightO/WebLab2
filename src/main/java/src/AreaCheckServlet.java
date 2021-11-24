package src;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Area Check Servlet", value = "/area-check")
public class AreaCheckServlet extends HttpServlet {
    public static final String ATTRIBUTE_POINTS = "points";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Point point = new Point(req);

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