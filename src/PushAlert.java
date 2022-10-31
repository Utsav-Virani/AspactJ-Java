public class PushAlert implements Viewers {
        private Netflix netflix;
        private String state;
        public PushAlert(Netflix netflix) {
            this.netflix = netflix;
            this.netflix.addAlert(this);
        }
        public void updateAlert() {
            this.state = netflix.getAlertUpdates();
        }
        public String getState() {
            return "PushAlert: " + this.state;
        }
    }