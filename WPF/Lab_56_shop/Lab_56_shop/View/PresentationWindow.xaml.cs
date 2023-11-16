using Lab_56_shop.ViewModel;
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
    /// Логика взаимодействия для PresentationWindow.xaml
    /// </summary>
    public partial class PresentationWindow : Window
    {
        public PresentationWindow()
        {
            InitializeComponent();

        }

        private void ShowMessage_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Привет, пользователь!");
        }
    }
}
