public class TeachingStaff implements Books {
        private Library library;
        private String state;
        public TeachingStaff(Library library) {
            this.library = library;
            this.library.addBook(this);
        }
        public void updateBookInfo() {
            this.state = library.getBookUpdate();
        }
        public String getBookState() {
            return "TeachingStaff: " + this.state;
        }
    }