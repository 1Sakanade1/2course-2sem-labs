package JDBC;
import java.sql.*;


public class DataBaseHandler extends Configs {
    Connection dbConnection;

    public Connection getDbConnection()
            throws ClassNotFoundException, SQLException {
        String connectionString = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

        Class.forName("com.mysql.jdbc.Driver");

        dbConnection = DriverManager.getConnection(connectionString, dbUser, dbPass);

        return dbConnection;
    }

    public void AddBook(String bookName,String authorName,String yearOfPublishing, String publisher){

        String insert = "INSERT INTO " + Const.BOOKS_TABLE + "(" + Const.BOOK_NAME + "," + Const.AUTHOR_NAME + "," +
                Const.YEAR_OF_PUBLISHING + "," + Const.PUBLISHER + ")" + "VALUES(?,?,?,?)";
        try {

        PreparedStatement prSt = getDbConnection().prepareStatement(insert);

        prSt.setString(1, bookName);
        prSt.setString(2, authorName);
        prSt.setString(3, yearOfPublishing);
        prSt.setString(4, publisher);


        prSt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void getAllBooks(){
        String query = "SELECT * FROM books";

        try {
            PreparedStatement prSt = getDbConnection().prepareStatement(query);

            ResultSet resultSet = prSt.executeQuery();

                while (resultSet.next()) {
                    System.out.println("BookName: " + resultSet.getString("Name") + ", Author_Name: " + resultSet.getString("Author_Name") +
                            ", Year_of_publishing: " + resultSet.getString("Year_of_publishing") + ", Publisher: " + resultSet.getString("Publisher"));
                }


        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void StartTransaction(String fileName){

        try {


            Statement prSt = getDbConnection().createStatement();

            prSt.executeQuery(fileName);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }


}
