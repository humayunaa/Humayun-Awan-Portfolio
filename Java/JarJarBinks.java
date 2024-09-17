import java.util.List;
import java.util.ArrayList;
import java.io.IOException;

//csv
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVFormat;
import java.io.Reader;

//gson
import com.google.gson.Gson;
import java.io.FileReader;
import java.io.FileWriter;


class StarWarsCharacter implements java.io.Serializable {

    String name = "";
    String height = "";
    String mass = "";
    String hairColor = "";
    String skinColor = "";
    String eyeColor = "";
    String birthYear = "";
    String gender = "";
    String homeworld = "";
    String species = "";

    public StarWarsCharacter() {}

    //getter for name
    public String getName() {
        return this.name;
    }

    //getter for height
    public String getHeight() {
        return this.height;
    }

    //getter for mass
    public String getMass() {
        return this.mass;
    }

    //getter for haircolor
    public String getHairColor() {
        return this.hairColor;
    }

    //getter for skin color
    public String getSkinColor() {
        return this.skinColor;
    }

    //getter for eye color
    public String getEyeColor() {
        return this.eyeColor;
    }

    //getter for birth year
    public String getBirthYear() {
        return this.birthYear;
    }

    //getter for gender
    public String getGender() {
        return this.gender;
    }

    //getter for home world
    public String getHomeWorld() {
        return this.homeworld;
    }

    //getter for species
    public String getSpecies() {
        return this.species;
    }

    //setter for name
    public void setName(String name) {
        this.name = name;
    }

    //setter for height
    public void setHeight(String height) {
        this.height = height;
    }

    //setter for mass
    public void setMass(String mass) {
        this.mass = mass;
    }

    //setter for hair color
    public void setHairColor(String hairColor) {
        this.hairColor = hairColor;
    }

    //setter for skin color
    public void setSkinColor(String skinColor) {
        this.skinColor = skinColor;
    }

    //setter for eye color
    public void setEyeColor(String eyeColor) {
        this.eyeColor = eyeColor;
    }

    //setter for birth year
    public void setBirthYear(String birthYear) {
        this.birthYear = birthYear;
    }

    //setter for gender
    public void setGender(String gender) {
        this.gender = gender;
    }

    //setter for home world
    public void setHomeWorld(String homeWorld) {
        this.homeworld = homeWorld;
    }

    //setter for species
    public void setSpecies(String species) {
        this.species = species;
    }

    //toString return name
    public String toString() {
        String output = "";
        output += getName();
        return output;
    }
}

//jarjar binks class contains main method
public class JarJarBinks {


    public static void main(String args[]) {
        try {
            List<StarWarsCharacter> characterList = new ArrayList<>();

            Reader in = new FileReader("characters.csv");
            CSVFormat CSVparser = CSVFormat.Builder.create().setHeader().build();
            Iterable<CSVRecord> records = CSVparser.parse(in);

            for(CSVRecord record: records) {


                StarWarsCharacter character = new StarWarsCharacter();


                character.name = record.get("name");
                character.height = record.get("height");
                character.mass = record.get("mass");
                character.hairColor = record.get("hair_color");
                character.skinColor = record.get("skin_color");
                character.eyeColor = record.get("eye_color");
                character.birthYear = record.get("birth_year");
                character.gender = record.get("gender");
                character.homeworld = record.get("homeworld");
                character.species = record.get("species");

                characterList.add(character);
            }

            FileWriter out = new FileWriter("characters.json");
            Gson gson = new Gson();
            gson.toJson(characterList, out);
            out.close();
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}