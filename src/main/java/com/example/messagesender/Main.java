package com.example.messagesender;

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
        int interval = Integer.parseInt(System.getenv("INTERVAL_MS"));
        mTimer.scheduleAtFixedRate(mTask, 1000, interval);
    }

    public static void main(String[] args) {
        Main m = new Main();
        m.start();

    }
}