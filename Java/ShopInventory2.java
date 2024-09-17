import java.util.Queue;
import java.util.*;

class Item {
    private final String name;
    private final double price;

    Item(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return this.name;
    }

    public double getPrice() {
        return this.price;
    }

    public String toString() {
        return this.name + " " + this.price;
    }
}

class Basket {
    private final Stack<Item> basket;

    Basket() {
        Stack<Item> stack = new Stack<Item>();
        this.basket = stack;
    }

    public void addItem(Item item) {
        this.basket.push(item);
    }

    public Item removeItem() {
        if (this.basket.size() > 0) {
            return this.basket.pop();
        } else {
            return null;
        }
    }
}

class Checkout {
    private final Queue<Item> checkout;
    Basket basket;

    Checkout(Basket basket) {
        Queue<Item> queue = new LinkedList<>();
        this.checkout = queue;
        this.basket = basket;
        Item item = basket.removeItem();   //cannot treat basket as Stack i.e use basket.size(). but can use functions
        while (item != null) {
            this.checkout.add(item);
            item = basket.removeItem();
        }
    }

    public void addItem(Item item) {
        this.checkout.add(item);
    }

    public Item removeItem() {
        if (this.checkout.size() > 0) {
            return this.checkout.remove();
        } else {
            return null;
        }
    }
}

class Bill {
    private final Map<String, Integer> basket;
    private double price;
    Checkout checkout;

    Bill(Checkout checkout) {
        this.checkout = checkout;
        this.price = 0.0;
        Map<String, Integer> hm = new LinkedHashMap<String, Integer>();  //LinkedHashMap vs HashMap. Linked.. keeps order
        this.basket = hm;
        Item item1 = this.checkout.removeItem();
        while (item1 != null) {
            this.billItem(item1);   //use this.__ intead of this.basket.__
            item1 = this.checkout.removeItem();
        }
    }

    public void billItem(Item item) {
        String name = item.getName();
        if (this.basket.containsKey(name)) {
            this.basket.put(item.getName(), this.basket.get(name) + 1);  //use this.basket.__
        } else {
            this.basket.put(name, 1);
        }
        this.price += item.getPrice();
    }

    public double getTotal() {
        return this.price;
    }

    public String toString() {
        String output = "";
        for(String item: this.basket.keySet()) {
            output += item + " (" + this.basket.get(item) + "nos)\n";
        }
        return output + "total: " + this.price;
    }
}

public class ShopInventory2 {
    ShopInventory2() {}

    public static void main(String[] args) {
        Basket basket = new Basket();
        loadBasket(basket);
        // System.out.println(basket); // for DEBUG
        Checkout checkout = new Checkout(basket);
        //System.out.println(checkout); // for DEBUG
        Bill bill = new Bill(checkout);
        //bill.billItem(new Item("Free-range Eggs", 3.35));
        System.out.println(bill);
    }
    
    static void loadBasket(Basket basket) {
        basket.addItem(new Item("Twinings Earl Grey Tea", 4.50));
        basket.addItem(new Item("Folans Orange Marmalade", 4.00));
        basket.addItem(new Item("Free-range Eggs", 3.35));
        basket.addItem(new Item("Brennan's Bread", 2.15));
        basket.addItem(new Item("Ferrero Rocher", 7.00));
        basket.addItem(new Item("Ferrero Rocher", 7.00));
    }
}