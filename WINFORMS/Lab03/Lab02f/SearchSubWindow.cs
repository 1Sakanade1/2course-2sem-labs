using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;

namespace Lab02f
{
    public partial class SearchSubWindow : Form
    {
        public List<Computer> Complist = new List<Computer>();
        public List<Computer> ComplistToSer = new List<Computer>();


        XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
        string filePath = @"computers.xml";
        string filePathToSer = @"search_computers.xml";

        public SearchSubWindow()
        {
            InitializeComponent();
        }

        private void SearchSubWindow_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)  //поиск по регекспу и по типу пк
        {

            try
            {
                if (!checkBox1.Checked && checkBox2.Checked && checkBox3.Checked && checkBox4.Checked)
                {
                    throw new Exception("Выберите хотябы один тип пк");
                }
                else if (textBox1.Text == string.Empty)
                {
                    throw new Exception("Укажите тип оперативной памяти");
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

                List<ComputerType> typeslist = new List<ComputerType>();                    //заполнение коллекции выбранными типами п

                if (checkBox1.Checked) typeslist.Add(ComputerType.laptop);//todo change to comptype
                if (checkBox2.Checked) typeslist.Add(ComputerType.personalComputer);
                if (checkBox3.Checked) typeslist.Add(ComputerType.workstation);
                if (checkBox4.Checked) typeslist.Add(ComputerType.server);



                Regex regex1 = new Regex($@"\w*{textBox1.Text}\w*");//модель видеокарты                   // может не работать этот регекс
                Regex regex2 = new Regex($@"\w*{textBox2.Text}\w*");//модель процессора


                listBox1.Items.Clear();
                foreach (ComputerType type in typeslist)
                {
                    foreach (Computer pc in Complist)           //по всем пк и по всем типам в typelist 
                    {

                        MatchCollection matchesManufacturer = regex1.Matches(pc.gpu.publichser);
                        MatchCollection matchesProcessor = regex2.Matches(pc.processor.manufacturer);

                        if (matchesManufacturer.Count > 0 && matchesProcessor.Count > 0 && pc.type == type)   //если подошел условию то добавляем 
                        {

                            listBox1.Items.Add(pc);

                        }

                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

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
