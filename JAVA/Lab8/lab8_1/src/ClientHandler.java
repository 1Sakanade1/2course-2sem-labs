import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ClientHandler implements Runnable {
    private final Socket clientSocket;
    private final int secretNumber;

    public ClientHandler(Socket clientSocket, int secretNumber) {
        this.clientSocket = clientSocket;
        this.secretNumber = secretNumber;
    }

    @Override
    public void run() {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
             PrintWriter writer = new PrintWriter(clientSocket.getOutputStream(), true)) {
            String guess;
            do {
                guess = reader.readLine();
                System.out.println("Received guess from " + clientSocket.getInetAddress().getHostAddress() + ": " + guess);
                int guessNumber = Integer.parseInt(guess);
                if (guessNumber < secretNumber) {
                    writer.println("Too low");
                } else if (guessNumber > secretNumber) {
                    writer.println("Too high");
                } else {
                    writer.println("Correct!");
                }
            } while (!guess.equals(Integer.toString(secretNumber)));
            System.out.println("Game over for " + clientSocket.getInetAddress().getHostAddress());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}