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
    /// Логика взаимодействия для DeleteWindow.xaml
    /// </summary>
    public partial class DeleteWindow : Window
    {
        DBHandler dbhandler = new DBHandler();
        

        private Command closeWindow;

        private Command deleteTovar;

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

        public ICommand DeleteTovar
        {
            get
            {
                return deleteTovar ?? (deleteTovar = new Command(obj =>
                {

                    dbhandler.DeleteElement(Delete_Name.Text);  

                }
                ));




            }
        }


        public DeleteWindow()
        {
            InitializeComponent();
        }
    }
}
