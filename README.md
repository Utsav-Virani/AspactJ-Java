Utsav Bharatbhai Virani(40211706)
Het Jatin Dalal

Technical details:
IntelliJ Ultimate
Java JDK v8
AspectJ Jar 1.9
GraphViz v6.0.2

Information about files:
- netflix_call_graph.png : Contains the final visualization(Graph Diagram) of the method call in java application
- netflix_call_graph.dot : Contains the in-put for the tool GraphViz for visualization
- *.java : Contains the code|ClasInterfaces of base application
- Logger.aj : Contains the AspectJ code.
- main.java : Root file for application

Information about the visualization from the file generated from the .dot file:
- There are 4 nodes [Library, Librarian, Sms Alert, TeachingStaff].
- Nodes Librarian, Sms Alert and TeachingStaff, all 3 nodes communicate with the Node Library with the bellow given methods.
  - addAlert
  - getAlertUpdates
  - updateAlert
  - notifyEveryone

