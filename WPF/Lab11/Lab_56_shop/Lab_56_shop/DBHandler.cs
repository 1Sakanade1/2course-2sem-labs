using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Lab_56_shop
{
    internal class DBHandler
    {

        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306;username=root;password=root;database=lab56_storeitems");

        public void OpenConnection()
        {
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        public void CloseConnection()
        {
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public MySqlConnection GetConnection()
        {
            return connection;
        }

        public void RefreshDB()
        {

        }

        public DataTable ItemNameSort(string ItemName)//"SELECT * FROM objects WHERE name LIKE @searchValue"
        {
            DBHandler db = new DBHandler();

            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            db.OpenConnection();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `products` WHERE product_name LIKE @searchValue", db.GetConnection());
            command.Parameters.AddWithValue("@searchValue", ItemName + "%");
            adapter.SelectCommand = command;

            adapter.Fill(table);
            db.CloseConnection();

            return table;
        }

        public void InsertElement(string name, string description, string price, string imagepath )
        {

            try { 
            DBHandler db = new DBHandler();
            db.OpenConnection();


            MySqlCommand command = new MySqlCommand("INSERT INTO `products`(`product_name`, `product_description`, `price`, `imagepath`) VALUES (@name,@description,@price,@imagepath)",db.GetConnection());
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@description", description);
            command.Parameters.AddWithValue("@price", Convert.ToInt32(price));
            command.Parameters.AddWithValue("@imagepath", imagepath);

            command.ExecuteNonQuery();

            db.CloseConnection();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void UpdateElement(string name, string description, string price, string imagepath)
        {

            try
            {
                DBHandler db = new DBHandler();
                db.OpenConnection();

                MySqlCommand command = new MySqlCommand("UPDATE `products` SET `product_description` = @description, `price` = @price, `imagepath` = @imagepath WHERE `products`.`product_name` = @name;",db.GetConnection());
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@description", description);
                command.Parameters.AddWithValue("@price", Convert.ToInt32(price));
                command.Parameters.AddWithValue("@imagepath", imagepath);

                command.ExecuteNonQuery();

                db.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void DeleteElement(string name)
        {

            try
            {
                DBHandler db = new DBHandler();
                db.OpenConnection();


                MySqlCommand command = new MySqlCommand("DELETE FROM `products` WHERE product_name = @name", db.GetConnection());
                command.Parameters.AddWithValue("@name", name);

                command.ExecuteNonQuery();

                db.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
