public class Point implements Comparable {
    private double x, y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public double getX() {
        return this.x;
    } public double getY() {
        return this.y;
    }

    public boolean equals(Point other) {
        if (this.x == other.x && this.y == other.y) {
            return true;
        } else {
            return false;
        }
    }

    public boolean lessThan(Point other) {
        if (this.x < other.x) {
            return true;
        } else if (this.x > other.x) {
            return false;
        } else if (this.equals(other) == true) {
            return false;
        } else {
            if (this.y < other.y) {
                return true;
            } else {
                return false;
            }
        }
    }

    @Override
    public boolean lessThan(Order other) {
        return lessThan((Point) other);
    }

    @Override
    public int compareTo(Object other) {
        Point object = (Point) other;
        if (this.lessThan(object) == true) {
            return -1;
        } else if (this.x == object.x && this.y == object.y) {
            return 0;
        } else {
            return 1;
        }
    }

    public String toString() {
        return "(" + this.x + "," + this.y + ")";
    }

    public static void main(String[] args) {
        Order p1 = new Point(2, 3);
        Order p2 = new Point(3, 3);
        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p1.lessThan(p2));
        Comparable p3 = new Point(1, 1);
        Comparable p4 = new Point(4, 4);
        System.out.println(p3.compareTo(p4));
    }
}


interface Order {
    public boolean lessThan(Order other);
}

interface Comparable extends Order {
    public int compareTo(Object other);
}