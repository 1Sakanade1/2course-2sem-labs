import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;

public class Server {
    private static final int PORT = 1234;
    private static final int MAX_NUMBER = 100;

    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            System.out.println("Server started on port " + PORT);
            Random random = new Random();
            int secretNumber = random.nextInt(MAX_NUMBER) + 1;
            System.out.println("Secret number is " + secretNumber);
            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client connected: " + clientSocket.getInetAddress().getHostAddress());
                new Thread(new ClientHandler(clientSocket, secretNumber)).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}