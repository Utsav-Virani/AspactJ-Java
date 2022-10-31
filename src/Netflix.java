import java.util.*;
public class Netflix implements StreamingUpdate {
    private String headline;
    private ArrayList<Viewers> viewers = new ArrayList<Viewers>();
    public void addAlert(Viewers viewers){
        this.viewers.add(viewers);
    }
    public void removeAlert(Viewers viewers) {
        this.viewers.remove(viewers);
    }
    public void notifyEveryone() {
        for (int i = 0; i < viewers.size(); i++)
            viewers.get(i).updateAlert();
    }
    public String getAlertUpdates() {
        return this.headline;
    }
    public void setHeadline(String state) {
        this.headline = state;
        this.notifyEveryone();
    }
}
