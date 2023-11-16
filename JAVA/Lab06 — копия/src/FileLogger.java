import java.util.logging.*;

public class FileLogger {

    private static final Logger LOGGER = Logger.getLogger(FileLogger.class.getName());
    private static final String LOG_FILE = "app.log";

    public void InfoLog(String message){
        // Создаем файловый обработчик (FileHandler) для записи логов в файл
        try {
            FileHandler fileHandler = new FileHandler(LOG_FILE);
            LOGGER.addHandler(fileHandler);
            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Ошибка при создании файла для логирования", e);
        }
        LOGGER.info( message);

    }
    public void WarningLog(String message){
        // Создаем файловый обработчик (FileHandler) для записи логов в файл
        try {
            FileHandler fileHandler = new FileHandler(LOG_FILE);
            LOGGER.addHandler(fileHandler);
            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Ошибка при создании файла для логирования", e);
        }
        LOGGER.log(Level.WARNING, message);
    }
    public void ErrorLog(String message){
        // Создаем файловый обработчик (FileHandler) для записи логов в файл
        try {
            FileHandler fileHandler = new FileHandler(LOG_FILE);
            LOGGER.addHandler(fileHandler);
            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Ошибка при создании файла для логирования", e);
        }
        LOGGER.log(Level.SEVERE,  message);
    }

}