using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lab_56_shop
{
    /// <summary>
    /// Логика взаимодействия для AddElementWindow.xaml
    /// </summary>
    public partial class AddElementWindow : Window
    {
        DBHandler dbhandler = new DBHandler();


        private Command closeWindow;

        private Command addTovar;

        public ICommand CloseWindow
        {
            get
            {
                return closeWindow ?? (closeWindow = new Command(obj =>
                {
                    this.Close();
                }
                ));




            }
        }

        public ICommand AddTovar
        {
            get
            {
                return addTovar ?? (addTovar = new Command(obj =>
                {
                    dbhandler.InsertElement(Add_Name.Text, Add_Description.Text, Add_Price.Text, Add_ImageLink.Text);

                }
                ));




            }
        }
        public AddElementWindow()
        {

        InitializeComponent();
        }


    }
}
