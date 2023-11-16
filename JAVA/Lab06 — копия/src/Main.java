import JDBC.DataBaseHandler;
import java.sql.SQLException;

package dependence;

public class Main  {

   public static void main(String[] args) throws SQLException, ClassNotFoundException {
      FileLogger logger = new FileLogger();


      DataBaseHandler dbHandler = new DataBaseHandler();

      dbHandler.getDbConnection();

      logger.InfoLog("added three musketeers");
/*   dbHandler.AddBook("Three_Musketeers","Alexandre_Dumas","1844","Publisher");*/

      logger.InfoLog("a list of all books is displayed");
      dbHandler.getAllBooks();

      String Filename = "transaction1.txt";

      dbHandler.StartTransaction(Filename);

}
}