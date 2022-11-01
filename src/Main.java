public class Main {

    public static void main(String[] args) {
        Library library = new Library();
        Librarian librarian = new Librarian(library);
        Admin admin = new Admin(library);
        TeachingStaff teachingStaff = new TeachingStaff(library);
        library.setAlert("Life 3.0 is now available at Library to read.");
        System.out.println(librarian.getState());
        System.out.println(admin.getState());
        System.out.println(teachingStaff.getBookState());
    }
}
