public class Admin implements Books {
    private Library library;
    private String state;
    public Admin(Library library) {
        this.library = library;
        this.library.addBook(this);
    }
    public void updateBookInfo() {
        this.state = library.getBookUpdate();
    }
    public String getState() {
        return "Admin: " + this.state;
    }
}