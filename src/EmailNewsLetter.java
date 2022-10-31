public class EmailNewsLetter implements Viewers {
    private Netflix netflix;
    private String state;
    public EmailNewsLetter(Netflix netflix) {
        this.netflix = netflix;
        this.netflix.addAlert(this);
    }
    public void updateAlert() {
        this.state = netflix.getAlertUpdates();
    }
    public String getState() {
        return "EmailNewsLetter: " + this.state;
    }
}
