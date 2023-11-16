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

namespace Lab02f
{
    public partial class ProcessorFrequencyFilter : Form
    {

        public List<Computer> Complist = new List<Computer>();
        public List<Computer> ComplistToSer = new List<Computer>();


        XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
        string filePath = @"computers.xml";
        string filePathToSer = @"RamSizeFiltred.xml";

        public ProcessorFrequencyFilter()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
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
                                        where p.processor.frequency < Convert.ToInt32(textBox2.Text) && p.processor.frequency > Convert.ToInt32(textBox1.Text)
                                        select p;


                listBox1.Items.Clear();
                foreach (Computer elem in selectedComputers)
                {
                    listBox1.Items.Add(elem);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
