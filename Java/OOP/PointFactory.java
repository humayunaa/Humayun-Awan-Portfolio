enum Quadrant {
    Q1, Q2, Q3, Q4
}

interface GridQuadrant {
    Quadrant getQuadrant();
}

interface CompareQuadrant {
    boolean isInSameQuadrant(Point point);
}

interface PointMaker {
    Point makePoint(double x, double y);
    int countPointsCreated();
}

class Point implements GridQuadrant, CompareQuadrant {
    private double x, y;
    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    } public double getX() {
        return this.x;
    } public double getY() {
        return this.y;
    }

    public String toString() {
        return "(" + x + "," + y + ")";
    }

    @Override
    public Quadrant getQuadrant() {
        if (this.x > 0 && this.y > 0) {
            return Quadrant.Q1;
        } if (this.x < 0 && this.y > 0) {
            return Quadrant.Q2;
        } if (this.x < 0 && this.y < 0) {
            return Quadrant.Q3;
        } if (this.x > 0 && this.y < 0) {
            return Quadrant.Q4;
        } else {
            return null;
        }
    }

    @Override
    public boolean isInSameQuadrant(Point point) {
        if (this.getQuadrant() == point.getQuadrant()) {
            return true;
        } else {
            return false;
        }
    }

}

public class PointFactory implements PointMaker {
    int count = 0;

    PointFactory() {}

    @Override
    public Point makePoint(double x, double y) {
        count++;
        return new Point(x, y);
    }

    @Override
    public int countPointsCreated() {
        return count;
    }

    public static void main(String[] args) {
        PointFactory p1 = new PointFactory();
        Point p2 = p1.makePoint(6, -2);
        Point p3 = p1.makePoint(5, 5);
        Point p4 = p1.makePoint(0, 0);
        System.out.println(p2);
        System.out.println(p3);
        System.out.println(p4);
        System.out.println(p2.getQuadrant());
        System.out.println(p3.getQuadrant());
        System.out.println(p4.getQuadrant());
        System.out.println(p1.countPointsCreated());
        System.out.println(p2.isInSameQuadrant(p3));
    }
}