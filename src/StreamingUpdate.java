public interface StreamingUpdate {
    public void addAlert(Viewers viewers);
    public void removeAlert(Viewers viewers);
    public void notifyEveryone();
}