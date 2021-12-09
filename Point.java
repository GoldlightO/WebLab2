package src;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;

public class Point {
    private final int x;
    private final double y;
    private final float r;
    private boolean insideArea;
    private long executionTime;

    public Point(HttpServletRequest req) {
        int x = Integer.parseInt(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        float r = Float.parseFloat(req.getParameter("r"));

        this.x = x;
        this.y = y;
        this.r = r;
    }

    public void calc() {
        long now = System.nanoTime();

        if (x < 0 && y > 0) insideArea = false;             //top left
        else if (x <= 0 && y <= 0 && y >= -(x / 2.0) - r / 2.0) insideArea = true;      //bottom left
        else if (x >= 0 && y >= 0 && y <= Math.sqrt(r / 2.0 * r / 2.0 - x * x)) insideArea = true;      //top right
        else insideArea = (x >= 0 && y <= 0 && x <= r / 2.0 && y >= -r);

        executionTime = System.nanoTime() - now;
    }

    public int getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public float getR() {
        return r;
    }

    public boolean isInsideArea() {
        return insideArea;
    }

    public long getExecutionTime() {
        return executionTime;
    }

    public String toJson() {
        return new Gson().toJson(this);
    }
}

