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
    /// Логика взаимодействия для UserControlElement.xaml
    /// </summary>
    public partial class UserControlElement : UserControl
    {
        public static string tb1;
        public static readonly DependencyProperty TextProperty =
           DependencyProperty.Register("MyText", typeof(string), typeof(TextBlock), new FrameworkPropertyMetadata(
                       string.Empty,
                       FrameworkPropertyMetadataOptions.AffectsMeasure |
                       FrameworkPropertyMetadataOptions.AffectsRender,
                       new PropertyChangedCallback(OnTextChanged)));

        public UserControlElement()
        {
            InitializeComponent();
        }



        public string MyText
        {
            get { return (string)GetValue(TextProperty); }
            set { SetValue(TextProperty, value); }
        }


        private static void OnTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var element = (UserControlElement)d;
            tb1 = (string)e.NewValue;
        }

        private void tb11_TextChanged(object sender, TextChangedEventArgs e)
        {   
            tb1 = tb11.Text;
        }
    }
}
