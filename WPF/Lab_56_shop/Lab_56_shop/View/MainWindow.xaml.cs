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
using Lab_56_shop.ViewModel;

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

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = new DataManagaMainWindow();

            DBHandler db = new DBHandler();

            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            db.OpenConnection();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `products`", db.GetConnection());

            adapter.SelectCommand = command;

            adapter.Fill(table);

        }

        public async Task<List<Product>> GetProductsAsync()
        {
            using (var context = new MyContext())
            {
                return await context.products
                    .Where(p => p.price > 1000)
                    .ToListAsync();
            }
        }

        public async Task CreateProductAsync(Product product)
        {
            using (var context = new MyContext())
            {
                context.products.Add(product);
                await context.SaveChangesAsync();
            }
        }

        public async Task UpdateProductAsync(Product product)
        {
            using (var context = new MyContext())
            {
                var existingProduct = await context.products.FindAsync(product.product_name);
                if (existingProduct != null)
                {
                    existingProduct.product_description = product.product_description;
                    existingProduct.price = product.price;
                    existingProduct.imagepath = product.imagepath;

                    await context.SaveChangesAsync();
                }
            }
        }

        public async Task DeleteProductAsync(string product_name)
        {
            using (var context = new MyContext())
            {
                var existingProduct = await context.products.FindAsync(product_name);
                if (existingProduct != null)
                {
                    context.products.Remove(existingProduct);
                    await context.SaveChangesAsync();
                }
            }
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
        private void Greetings_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Привет, пользователь!");
        }

    }
    }


