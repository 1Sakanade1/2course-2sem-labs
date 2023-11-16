using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace Lab02f
{
    public partial class RamSizeFilter : Form
    {
        public List<Computer> Complist = new List<Computer>();
        public List<Computer> ComplistToSer = new List<Computer>();


        XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
        string filePath = @"computers.xml";
        string filePathToSer = @"RamSizeFiltred.xml";

        public RamSizeFilter()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {

                if (textBox1.Text == string.Empty || textBox2.Text == string.Empty)
                {
                    throw new Exception("Заполните все поля");
                }



                using (var reader = new StreamReader(filePath))         //десереализация в коллекцию
                {
                    // Десериализуем коллекцию из файла
                    var compobjects = (List<Computer>)xmlSerializer.Deserialize(reader);
                    // Используем коллекцию

                    foreach (Computer elem in compobjects)
                    {
                        Complist.Add(elem);

                    }
                }

                var selectedComputers = from p in Complist
                                        where p.price < Convert.ToInt32(textBox2.Text) && p.price > Convert.ToInt32(textBox1.Text)
                                        select p;


                listBox1.Items.Clear();
                foreach(Computer elem in selectedComputers)
                {
                    listBox1.Items.Add(elem);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (ComplistToSer.Count == 0)
            {
                MessageBox.Show("Коллекция пуста");
            }
            else
            {
                using (FileStream stream = new FileStream(filePathToSer, FileMode.OpenOrCreate))
                {
                    xmlSerializer.Serialize(stream, ComplistToSer);
                    MessageBox.Show("Сериализация выполнена");
                }
            }
        }
    }
}
