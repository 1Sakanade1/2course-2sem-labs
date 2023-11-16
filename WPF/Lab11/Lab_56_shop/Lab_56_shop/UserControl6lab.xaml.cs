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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab_56_shop
{
    /// <summary>
    /// Логика взаимодействия для UserControl6lab.xaml
    /// </summary>
    public partial class UserControl6lab : UserControl
    {
        public UserControl6lab()
        {
            InitializeComponent();
        }
        private void button_Click(object sender, RoutedEventArgs e)
        {
            txtBox.Text = "You have just clicked the button";
        }
    }
}
