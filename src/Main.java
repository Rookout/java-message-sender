import java.util.Timer;
import java.util.TimerTask;

public class Main {
    private Timer mTimer = new Timer();

    private TimerTask mTask = new TimerTask() {
        @Override
        public void run() {
            System.out.println("Hello world!");
        }
    };

    private void start() {
        mTimer.scheduleAtFixedRate(mTask, 1000, 1000);
    }

    public static void main(String[] args) {
        Main m = new Main();
        m.start();

    }
}