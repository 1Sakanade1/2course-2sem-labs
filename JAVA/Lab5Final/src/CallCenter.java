import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public class CallCenter {
    private static final int N = 5; // количество операторов колл-центра
    private static final int K = 10 ; // количество пользователей
    private static final long WAITING_TIME = 1000; // время ожидания в миллисекундах

    public static void main(String[] args) throws InterruptedException {
        Semaphore callCenter = new Semaphore(N, true); // семафор для колл центра

        for (int i = 1; i <= K; i++) {
            new Thread(() -> {
                while (true) {
                    try {
                        if (callCenter.tryAcquire(WAITING_TIME, TimeUnit.MILLISECONDS)) {
                            System.out.println(Thread.currentThread().getName() + " дозвонился до оператора");
                            TimeUnit.SECONDS.sleep(2);
                            callCenter.release();
                            System.out.println( Thread.currentThread().getName() + " отключился от оператора");
                            break;
                        } else {
                            System.out.println(Thread.currentThread().getName() + " Ожидает ответа");
                            TimeUnit.SECONDS.sleep(2);
                        }

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }, "Клиент " + i).start();
        }
    }
}