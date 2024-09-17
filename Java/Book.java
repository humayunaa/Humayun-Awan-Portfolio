enum BookMedium {
EBook, PhysicalBook, AudioBook
} enum BookGenre {
Fiction, NonFiction
} enum BookRating {
Rating1, Rating2, Rating3, Rating4, Rating5
}

public class Book {
    //if call in class must be a field
    private String title;
    private String author;
    private int pub_date;
    private int read_date;
    private BookMedium medium;
    private BookRating rating;
    private BookGenre genre;
    //TYPE1: title, author, genre
    public Book(String title, String author, BookGenre genre) {
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.pub_date = 0;
    //TYPE2: titlem author, genre, published date
    } public Book(String title, String author, BookGenre genre, int pub_date) {
        this.title = title;
        this.author = author;
        this.pub_date = pub_date;
        this.genre = genre;
        this.read_date = 0;
    //TYPE3: ALL
    } public Book(String title, String author, BookGenre genre, int pub_date, int read_date, BookMedium medium, BookRating rating) {
        this.title = title;
        this.author = author;
        this.pub_date = pub_date;
        this.read_date = read_date;
        this.medium = medium;
        this.genre = genre;
        this.rating = rating;
    //To print out b1, b2, b3 etc,
    // use if-else to print out for each type
    // **this is why type1 has pub_date = 0, and type2 has read_date = 0. so we can print no matter what "type" is used
    } public String toString() {
        if (this.pub_date != 0){
            if (this.read_date != 0){
                String rating_num = this.rating.toString();
                return this.title + " by " + this.author + " (" + this.pub_date + ")" + " - read in " + this.read_date + 
                ", rated " + rating_num.charAt(rating_num.length() - 1) + "/5";  //type3
            } else {  //type2
                return this.title + " by " + this.author + " (" + pub_date + ")";  //type2
            }
        } else {  //type1
            return this.title + " by " + this.author;  //type1
        }
    } public String getTitle() {
        return this.title;
    } public String getAuthor() {
        return this.author;
    } public int getPublishedDate() {
        return this.pub_date;
    } public int getReadDate() {
        return this.read_date;
    } public BookGenre getGenre() {
        return this.genre;
    } public BookRating getRating() {
        return this.rating;
    } public BookMedium getMedium() {
        return this.medium;
    }
    public static void main(String args[]){
        Book b1 = new Book("Children of Time", "Adrian Tchaikovsky", BookGenre.Fiction);
        System.out.println(b1);
        Book b2 = new Book("The Fifth Season", "N. K. Jemesin", BookGenre.Fiction, 2015);
        System.out.println(b2);
        Book b3 = new Book("Perdido Street Station", "China Mieville",
        BookGenre.Fiction, 2000, 2020, BookMedium.EBook, BookRating.Rating5);
        System.out.println(b3);
        System.out.println(b1.getTitle());
        System.out.println(b1.getAuthor());
        System.out.println(b1.getGenre());
        System.out.println(b2.getPublishedDate());
        System.out.println(b3.getReadDate());
        System.out.println(b3.getMedium());
        System.out.println(b3.getRating());
    }
}