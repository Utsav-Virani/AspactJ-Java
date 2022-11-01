public class Main {

    public static void main(String[] args) {
        Netflix netflix = new Netflix();
        EmailNewsLetter observer1 = new EmailNewsLetter(netflix);
        SmsAlert observer2 = new SmsAlert(netflix);
        PushAlert observer3 = new PushAlert(netflix);
        netflix.setAlert("Friends is now available on Netflix");
        System.out.println(observer1.getState());
        System.out.println(observer2.getState());
        System.out.println(observer3.getState());
    }
}
