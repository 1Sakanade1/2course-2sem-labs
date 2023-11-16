using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab_56_shop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 
    
    public partial class MainWindow : Window
    {
        DBHandler dbhandler = new DBHandler();


        bool style = true;

        int styleNumber = 0;

        private Command search;

        private Command openAddWindow;


        private Command openUpdateWindow;

        private Command openDeleteWindow;

        private Command openPresentationWindow;

        private Command openLab7Task;

        private Command changeTheme;


        public ICommand Search
        {
            get
            {
                return search ?? (search = new Command(obj =>
                {
                    listviewProducts.ItemsSource = GetAllTovars(UserControlElement.tb1).DefaultView;
                }
                ));

            }
        }

        public static DataTable GetAllTovars(string nameStr)
        {
            using (var context = new MyContext())
            {
                var products = from p in context.products
                               where p.product_name.StartsWith(nameStr)
                               select new
                               {
                                   p.product_name,
                                   p.price,
                                   p.imagepath,
                                   p.product_description
                               };

                DataTable table = new DataTable();
                table.Columns.Add("product_name", typeof(string));
                table.Columns.Add("price", typeof(int));
                table.Columns.Add("imagepath", typeof(string));
                table.Columns.Add("product_description", typeof(string));

                foreach (var product in products)
                {
                    DataRow row = table.NewRow();
                    row["product_name"] = product.product_name;
                    row["price"] = product.price;
                    row["imagepath"] = product.imagepath;
                    row["product_description"] = product.product_description;
                    table.Rows.Add(row);
                }

                return table;
            }
        }




        public ICommand OpenAddWindow
        {
            get
            {
                return openAddWindow ?? (openAddWindow = new Command(obj =>
                {
                    AddElementWindow addElementWindow = new AddElementWindow();

                    addElementWindow.Show();
                }
                ));




            }
        }

        public ICommand OpenUpdateWindow
        {
            get
            {
                return openUpdateWindow ?? (openUpdateWindow = new Command(obj =>
                {
                    UpdateWindow updateElementWindow = new UpdateWindow();

                    updateElementWindow.Show();
                }
                ));




            }
        }

        public ICommand OpenDeleteWindow
        {
            get
            {
                return openDeleteWindow ?? (openDeleteWindow = new Command(obj =>
                {
                    DeleteWindow deleteWindow = new DeleteWindow();

                    deleteWindow.Show();
                    
                }
                ));




            }
        }

        public ICommand OpenPresentationWindow
        {
            get
            {
                return openPresentationWindow ?? (openPresentationWindow = new Command(obj =>
                {
                    PresentationWindow presentationWindow = new PresentationWindow();

                    presentationWindow.Show();
                }
                ));




            }
        }

        public ICommand OpenLab7Task
        {
            get
            {
                return openLab7Task ?? (openLab7Task = new Command(obj =>
                {
                    Lab7 lab7 = new Lab7();

                    lab7.Show();
                }
                ));




            }
        }

        public ICommand ChangeTheme
        {
            get
            {
                return changeTheme ?? (changeTheme = new Command(obj =>
                {
                    if (styleNumber == 0)
                    {
                        var uri = new Uri("MintTheme.xaml", UriKind.Relative);
                        ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                        Application.Current.Resources.Clear();
                        Application.Current.Resources.MergedDictionaries.Add(resourceDict);
                        styleNumber = 1;
                    }
                    else if(styleNumber == 1)
                    {
                        var uri = new Uri("PeachTheme.xaml", UriKind.Relative);
                        ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                        Application.Current.Resources.Clear();
                        Application.Current.Resources.MergedDictionaries.Add(resourceDict);

                        styleNumber = 2;
                    }

                    else
                    {
                        var uri = new Uri("Styles.xaml", UriKind.Relative);
                        ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                        Application.Current.Resources.Clear();
                        Application.Current.Resources.MergedDictionaries.Add(resourceDict);

                        styleNumber = 0;
                    }


                }
                ));




            }
        }


        public MainWindow()
        {
            InitializeComponent();

            DBHandler db = new DBHandler();

            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            db.OpenConnection();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `products`", db.GetConnection());

            adapter.SelectCommand = command;

            adapter.Fill(table);

        }


        private void Image_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

            if (GoodsCatalog.Width == 0)
            {
                DoubleAnimation animation = new DoubleAnimation();
                animation.From = 0;
                animation.To = 400;
                animation.Duration = TimeSpan.FromSeconds(0.2);
                GoodsCatalog.BeginAnimation(TextBlock.WidthProperty, animation);
            }
            else
            {
                DoubleAnimation animation = new DoubleAnimation();
                animation.From = 400;
                animation.To = 0;
                animation.Duration = TimeSpan.FromSeconds(0.2);
                GoodsCatalog.BeginAnimation(TextBlock.WidthProperty, animation);
            }


        }

        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            
            
            if (!style)
            {
                var uri = new Uri("RusDictionary.xaml", UriKind.Relative);
                ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                Application.Current.Resources.Clear();
                Application.Current.Resources.MergedDictionaries.Add(resourceDict);


                style = true;
            }
            else
            {
                var uri = new Uri("EngDictionary.xaml", UriKind.Relative);
                ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                Application.Current.Resources.Clear();
                Application.Current.Resources.MergedDictionaries.Add(resourceDict);

                style = false;
            }
        }


        //Поиск строки по имени в listview
        private FrameworkElement FindByName(string name, FrameworkElement root)
        {
            Stack<FrameworkElement> tree = new Stack<FrameworkElement>();
            tree.Push(root);

            while (tree.Count > 0)
            {
                FrameworkElement current = tree.Pop();
                if (current.Name == name)
                    return current;

                int count = VisualTreeHelper.GetChildrenCount(current);
                for (int i = 0; i < count; ++i)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(current, i);
                    if (child is FrameworkElement)
                        tree.Push((FrameworkElement)child);
                }
            }
            return null;
        }

        //вводить в самом методе
/*        object o = listviewProducts.SelectedItem;
        ListViewItem lvi = (ListViewItem)listviewProducts.ItemContainerGenerator.ContainerFromItem(o);
        TextBlock tb = FindByName("description", lvi) as TextBlock;*/


    }
    }


