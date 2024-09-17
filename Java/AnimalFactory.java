interface SafetyRegulation {
    int getMaxItemsPermitted();
}

abstract class Item implements SafetyRegulation {
}

class Duck extends Item {
    @Override
    public int getMaxItemsPermitted() {
        return 5;
    }
}

class Swan extends Item {
    @Override
    public int getMaxItemsPermitted() {
        return 2;
    }
}

class Flamingo extends Item {
    @Override
    public int getMaxItemsPermitted() {
        return 3;
    }
}

class Dog extends Item {
    @Override
    public int getMaxItemsPermitted() {
        return 20;
    }
}

class Cat extends Item {
    @Override
    public int getMaxItemsPermitted() {
        return 20;
    }
}

public class AnimalFactory<T extends SafetyRegulation> {
    int unitsProduced = 0;
    T animal;

    public T continueProduction(T animal) {
        unitsProduced ++;
        if (unitsProduced < animal.getMaxItemsPermitted()) {
            return animal;
        } else {
            return null;
        }
    }

    public int getCount() {
        return unitsProduced;
    }

    public static void main(String[] args) {
        AnimalFactory<Duck> AF_D = new AnimalFactory<>();
        while(AF_D.continueProduction(new Duck()) != null);
        System.out.println("Total Ducks produced: " + AF_D.getCount());
        
        AnimalFactory<Swan> AF_S = new AnimalFactory<>();
        while(AF_S.continueProduction(new Swan()) != null);
        System.out.println("Total Swans produced: " + AF_S.getCount());

        AnimalFactory<Flamingo> AF_F = new AnimalFactory<>();
        while(AF_F.continueProduction(new Flamingo()) != null);
        System.out.println("Total Flamingos produced: " + AF_F.getCount());

        AnimalFactory<Dog> AF_G = new AnimalFactory<>();
        while(AF_G.continueProduction(new Dog()) != null);
        System.out.println("Total Dogs produced: " + AF_G.getCount());

        AnimalFactory<Cat> AF_C = new AnimalFactory<>();
        while(AF_C.continueProduction(new Cat()) != null);
        System.out.println("Total Cats produced: " + AF_C.getCount());
    }
}