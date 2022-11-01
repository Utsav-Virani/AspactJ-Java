import java.util.*;
public class Library implements StreamingUpdate {
    private String headline;
    private ArrayList<Books> viewers = new ArrayList<Books>();
    public void addBook(Books books){
        this.viewers.add(books);
    }
    public void removeBook(Books books) {
        this.viewers.remove(books);
    }
    public void sendMessageToEveryone() {
        for (int i = 0; i < viewers.size(); i++)
            viewers.get(i).updateBookInfo();
    }
    public String getBookUpdate() {
        return this.headline;
    }
    public void setAlert(String state) {
        this.headline = state;
        this.sendMessageToEveryone();
    }
}
