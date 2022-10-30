import java.lang.Thread;
import java.io.*;
import java.util.*;
import java.text.*;

public aspect Logger {
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    private int n = 0;
    {
        try {
            PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", false));
            out.println(
                    "/*\n" +
                            " * Description: This is an automatically generated .DOT file\n" +
                            " * representing a call graph.\n" +
                            " * Author: Utsav Bharatbhai Virani, Het Jatin Dalal\n" +
                            " * Date: " +dateFormat.format(date) + "\n" +
                    " *\n" +
                    " */\n" +
                    "digraph call_graph {\n" +
                    " node [shape = oval];");
            out.close();
        } catch (IOException e) {}
    }

    pointcut AddObserver() : call (* Subject.addObserver(..));
    pointcut notifyObserver() : execution (* Subject.notifyObservers(..));
    pointcut getHeadline() : call (* Blogger.getHeadline(..));
    pointcut update() : call (* *.update(..));
    pointcut executeAtTheEnd(): execution (* Test.main(..));

    after() returning() : executeAtTheEnd() {
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
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
            Runtime.getRuntime().exec("dot -Tsvg callgraph.dot -o callgraph.svg");
            System.out.println("Graph Generated Successfully.");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    before() : AddObserver() {
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    before(): notifyObserver(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    before(): update(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
                out.println(" " +thisJoinPoint.getThis().getClass().getName()+" -> " +
                        thisJoinPoint.getTarget().getClass().getName()+
                        "[ label = \"" + ++n + ". " +thisJoinPoint.getSignature().getName()+ "\" ];" );
                out.close();
            } catch (IOException e) {}

        }
    }
    after(): getHeadline(){
        {
            try {
                PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
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
//            PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
//            out.println("}");
//            out.close();
//        } catch (IOException e) {
//            System.out.println("InterruptedException caught");
//        }
//    }
}