import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {
    private static final String SERVER_IP = "127.0.0.1";
    private static final int SERVER_PORT = 1234;

    public static void main(String[] args) {
        try (Socket socket = new Socket(SERVER_IP, SERVER_PORT);
             BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader consoleReader = new BufferedReader(new InputStreamReader(System.in))) {
            System.out.println("Подключился к серверу");
            String response;
            do {
                System.out.print("Введите число: ");
                String guess = consoleReader.readLine();
                writer.println(guess);
                response = reader.readLine();
                System.out.println(response);
            } while (!response.equals("Correct!"));
            System.out.println("Game over");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}