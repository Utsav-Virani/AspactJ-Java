public class Librarian implements Books {
    private Library library;
    private String state;
    public Librarian(Library library) {
        this.library = library;
        this.library.addBook(this);
    }
    public void updateBookInfo() {
        this.state = library.getBookUpdate();
    }
    public  void removeBook() {library.removeBook(this);}
    public String getState() {
        return "Librarian: " + this.state;
    }
}
