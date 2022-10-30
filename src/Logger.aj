public aspect Logger {
    pointcut AddObserver() : call (* Subject.addObserver(..));
    before() : AddObserver() {
        System.out.println("observer" + thisJoinPoint);
    }

    pointcut notifyObserver() : execution (* Subject.notifyObservers(..));
    before(): notifyObserver(){
        System.out.println("to notify " + thisJoinPoint);
    }

    pointcut update() : execution (* Observer.update(..));
    before(): update(){
        System.out.println("to update " + thisJoinPoint);
    }

    pointcut getHeadline() : call (* Blogger.getHeadline(..));
    after(): getHeadline(){
        System.out.println("Got headline" + thisJoinPoint);
    }
}