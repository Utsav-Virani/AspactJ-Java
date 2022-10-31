public class SmsAlert implements Viewers {
    private Netflix netflix;
    private String state;
    public SmsAlert(Netflix netflix) {
        this.netflix = netflix;
        this.netflix.addAlert(this);
    }
    public void updateAlert() {
        this.state = netflix.getAlertUpdates();
    }
    public String getState() {
        return "SmsAlert: " + this.state;
    }
}