import java.text.DecimalFormat;

abstract class Item {
    String name;
    double price;
    int expirayInDays;

    Item(String name) {
        this.name = name;
    }

    Item(String name, int expirayInDays, double price) {
        this.name = name;
        this.price = price;
        this.expirayInDays = expirayInDays;
    }

    public String toString() {
        return name + " (" + price + ")";
    }

}

interface StorageCondition {
    String storageProcedure();
}

interface Refrigerate {
    boolean refrigerate(double currentTemp);
}

interface SecureItem extends StorageCondition {
    void attachSecurityTag();
    void removeSecurityTag();  //!!!//
}

interface ReducedPrice {
    double reduction(double totalAmount);
}

interface OnSale {
    boolean saleCondition(Item[] items);
}


class Milk extends Item implements Refrigerate, StorageCondition {
    int maxRefrigerateTemp;
    double currentTemp;

    private Milk(String name) {
        super(name);
    }

    Milk(String name, int expirayInDays, double price, int maxRefrigerateTemp) {
        super(name, expirayInDays, price);
        this.maxRefrigerateTemp = maxRefrigerateTemp;
    }

    @Override
    public boolean refrigerate(double currentTemp) {
        if (currentTemp <= maxRefrigerateTemp) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public String storageProcedure() {
        return "refrigeration needed";
    }

    @Override
    public String toString() {
        return name + " (" + price + ")" + " (Storage: " + storageProcedure() + ")";
    }
}

class Bread extends Item implements StorageCondition {

    private Bread(String name) {
        super(name);
    }

    Bread(String name, int expirayInDays, double price) {
        super(name, expirayInDays, price);
    }

    @Override
    public String storageProcedure() {
        return "Airtight Storage";
    }

    @Override
    public String toString() {
        return name + " (" + price + ")" + " (Storage: " + storageProcedure() + ")";
    }
}

class Perfume extends Item implements SecureItem {
    private boolean locked;

    private Perfume(String name) {
        super(name);
    }

    Perfume(String name, int expirayInDays, double price) {
        super(name, expirayInDays, price);
        this.attachSecurityTag();
    }

    @Override
    public void attachSecurityTag() {
        this.locked = true;
    }

    @Override
    public void removeSecurityTag() {
        if (locked == true) {
            this.locked = false;
        }
    }

    @Override
    public String storageProcedure() {
        return "Away from Sunlight";
    }

    boolean getLocked() {
        return this.locked;
    }

    @Override
    public String toString() {
        return name + " (" + price + ")" + " (Storage: " + storageProcedure() + ")";
    }

}

class PlasticCup extends Item {
    
    private PlasticCup(String name) {
        super(name);
    }

    PlasticCup(String name, int expirayInDays, double price) {
        super(name, expirayInDays, price);
    }
}

class EasterSale implements OnSale, ReducedPrice {
    final String message;
    final double minimumAmount;
    final double salePercent;

    EasterSale(double salePercent, double minimumAmount){
        this.minimumAmount = minimumAmount;
        this.salePercent = salePercent / 100;
        DecimalFormat format = new DecimalFormat("0.#");
        this.message = "Spend over " + format.format(minimumAmount) + ", Get "
        + (this.salePercent*100) + "% off for Easter!";
    }

    public static double totalAmount(Item[] items) {
        double total = 0.0;
        int i = 0;
        while (i < items.length) {
            total = total + items[i].price;
            i++;
        } return total;
       }

    @Override
    public boolean saleCondition(Item[] items) {
        double total = totalAmount(items);
        if (total > minimumAmount) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public double reduction(double totalAmount) {
        return totalAmount - (totalAmount * salePercent);
    }

    public String toString() {
        return message;
    }

}

public class ShopInventory extends EasterSale {

   ShopInventory(double minimumAmount, double salePercent){
    super(minimumAmount, salePercent);
   }

   public static double billItems(Item[] items, EasterSale Sale) {
    double total = totalAmount(items);
    if (Sale != null && Sale.saleCondition(items) == true) {
        return Sale.reduction(total);
    } 
    return total;
   }

   public static int getCurrentTemperature() {
    return 24;
   }

    public static String TheAnswer(Item[] items, EasterSale Sale) {
        String result = "";
        int i = 0;
        while (i < items.length - 1) {
            result = result + items[i].toString() + "\n";
            i++;
        }
        result = result + items[items.length - 1].toString();

        if (Sale != null) {
            result = result + "\n" + "Actual Total: " + totalAmount(items) + "\n" + Sale.message;
        }
        return result;
    }

   public static void main(String[] args) {
    DecimalFormat df = new DecimalFormat("#.##");

    System.out.println("--- Customer 1 ---");
    Item[] items_no_sale = {
        new Milk("Avenmore Fresh", 5, 1.90, 12),
        new Bread("Bretzel Tortano", 7, 4.50),
        new Perfume("Lynx Vanilla", 500, 7),
        new PlasticCup("Tea Mug", 1200, 12),
    };
    double total_no_sale = billItems(items_no_sale, null);

    System.out.println(TheAnswer(items_no_sale, null));
    System.out.println("Total Amount: " + df.format(total_no_sale));

    /////

    System.out.println("--- Customer 2 ---");

    Item[] items_easter_sale = {
        new Milk("Mulled Wine", 60, 22.20, 8),
        new Bread("Fruit Cakes", 20, 13.50),
        new Perfume("Pot-pourri", 500, 15),
        new PlasticCup("Party Cups (set of 12)", 1200, 2),
    };
    double total_easter_sale = billItems(items_easter_sale, new EasterSale(7.5, 50));

    System.out.println(TheAnswer(items_easter_sale, new EasterSale(7.5, 50)));
    System.out.println("Total Amount: " + df.format(total_easter_sale));
   }
}