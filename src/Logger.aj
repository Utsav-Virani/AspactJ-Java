import java.io.*;
import java.util.*;
import java.text.*;

public aspect Logger {
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    private int n = 0;
    {
        try {
            PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", false));
            out.println(
                    "/*\n" +
                            " * Description: This is an automatically generated .DOT file\n" +
                            " * representing a call graph.\n" +
                            " * Author: Utsav Bharatbhai Virani, Het Jatin Dalal\n" +
                            " * Date: " +dateFormat.format(date) + "\n" +
                    " *\n" +
                    " */\n" +
                    "digraph Library_call_graph {\n" +
                    " node [shape = oval];");
            out.close();
        } catch (IOException e) {}
    }

    pointcut addBookTrack() : call (* StreamingUpdate.addBook(..));
    pointcut sendMessageToEveryone() : execution (* StreamingUpdate.sendMessageToEveryone(..));
    pointcut getBookUpdateTrack() : call (* Library.getBookUpdate(..));
    pointcut updateBookInfo() : call (* *.updateBookInfo(..));
    pointcut executeAtTheEnd(): execution (* Main.main(..));

    after() returning() : executeAtTheEnd() {
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
            out.println("}");
            out.close();
            } catch (IOException e) {
                System.out.println(e);
            }
        }
    }
    after() returning() : executeAtTheEnd() {
        try {
            System.out.println("Generating Graph");
            Runtime.getRuntime().exec("dot -Tpng Library_call_graph.dot -o Library_call_graph.png");
            System.out.println("Graph Generated Successfully.");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    before() : addBookTrack() {
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    before(): sendMessageToEveryone(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    before(): updateBookInfo(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    after(): getBookUpdateTrack(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
//    {
//        try {
////            Thread.sleep(1000);
//            PrintWriter out = new PrintWriter(new FileWriter("Library_call_graph.dot", true));
//            out.println("}");
//            out.close();
//        } catch (IOException e) {
//            System.out.println("InterruptedException caught");
//        }
//    }
}