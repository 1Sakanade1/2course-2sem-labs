import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public class Parking {
    private static final int N = 5; // количество мест на первой стоянке
    private static final int M = 3; // количество мест на второй стоянке
    private static final int K = 10 ; // количество автомобилей, которые нужно припарковать
    private static final long WAITING_TIME = 1000; // время ожидания в миллисекундах

    public static void main(String[] args) throws InterruptedException {
        Semaphore parking1 = new Semaphore(N, true); // семафор для первой стоянки
        Semaphore parking2 = new Semaphore(M, true); // семафор для второй стоянки

        for (int i = 1; i <= K; i++) {
            new Thread(() -> {
                try {
                    if (parking1.tryAcquire(WAITING_TIME, TimeUnit.MILLISECONDS)) {
                        System.out.println("Автомобиль " + Thread.currentThread().getName() + " припарковался на первой стоянке");
                        TimeUnit.SECONDS.sleep(2);
                        parking1.release();
                        System.out.println("Автомобиль " + Thread.currentThread().getName() + " покинул первую стоянку");
                    } else if (parking2.tryAcquire(WAITING_TIME, TimeUnit.MILLISECONDS)) {
                        System.out.println("Автомобиль " + Thread.currentThread().getName() + " припарковался на второй стоянке");
                        TimeUnit.SECONDS.sleep(2);
                        parking2.release();
                        System.out.println("Автомобиль " + Thread.currentThread().getName() + " покинул вторую стоянку");
                    } else {
                        System.out.println("Автомобиль " + Thread.currentThread().getName() + " не смог припарковаться и уехал");
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }, "Автомобиль " + i).start();
        }
    }
}