public class Main {

    public static void main(String[] args) {
        Netflix netflix = new Netflix();
        EmailNewsLetter observer1 = new EmailNewsLetter(netflix);
        SmsAlert observer2 = new SmsAlert(netflix);
        PushAlert observer3 = new PushAlert(netflix);
        netflix.setHeadline("Le Comiccon de Montreal. " +
                "Du 13 au 15 septembre 2013.");
        System.out.println(observer1.getState());
        System.out.println(observer2.getState());
        System.out.println(observer3.getState());
    }
}
