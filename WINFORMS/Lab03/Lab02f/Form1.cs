using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using System.Xml.Serialization;

namespace Lab02f
{
    public partial class Form1 : Form
    {
       public List<Computer> Complist = new List<Computer>();


        XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<Computer>));
        string filePath = @"computers.xml";

        Timer timer;

        UndoRedoHandler undoRedoHandler = new UndoRedoHandler();

        void timer_Tick(object sender, EventArgs e)
        {
            toolStripStatusLabel2.Text = DateTime.Now.ToLongDateString();
            toolStripStatusLabel3.Text = DateTime.Now.ToLongTimeString();
        }


        public Form1()
        {
            InitializeComponent();
            timer = new Timer() { Interval = 1000 };
            timer.Tick += timer_Tick;
            timer.Start();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {

        }

        private void radioButton9_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton8_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


            Computer comp = new Computer();




            try
            {

                //ТИП ПК
                switch (comboBox3.Text)
                {
                    case "server":

                        comp.type = ComputerType.server;

                        break;


                    case "laptop":

                        comp.type = ComputerType.laptop;

                        break;


                    case "workstation":

                        comp.type = ComputerType.workstation;

                        break;


                    case "personal":

                        comp.type = ComputerType.personalComputer;

                        break;

                    default: throw new Exception("Укажите тип пк");
                }




                //МЕСТО НА ДИСКЕ
                int numericValueSpace;
                bool isNumberSpace = int.TryParse(textBox8.Text, out numericValueSpace);
                if (isNumberSpace)
                {
                    comp.hardSpace = numericValueSpace;
                }
                else
                {
                    throw new Exception("значение \"Объём диска\" должно быть числом");
                }

                //Стоимость
                int numericValuePrice;
                bool isNumberPrice = int.TryParse(textBox9.Text, out numericValuePrice);
                if (isNumberPrice)
                {
                    comp.price = numericValuePrice;
                }
                else
                {
                    throw new Exception("значение \"Cтоимость\" должно быть числом");
                }

                //ТИП ДИСКА
                if (radioButton9.Checked)
                {
                    comp.hardType = "SSD";
                }
                else if (radioButton8.Checked)
                {
                    comp.hardType = "HDD";
                }
                else
                {
                    throw new Exception("Укажите тип диска");
                }


                if (monthCalendar1.DataBindings != null)
                {
                    //ДАТА ПОСТУПЛЕНИЯ 
                    comp.date = Convert.ToString(monthCalendar1.DataBindings);
                }
                else
                {
                    throw new Exception("Укажите дату поступления пк");

                }
                //ВИДЕОКАРТА
                switch (comboBox4.Text)
                {
                    case ("RTX2060"):
                        comp.gpu = new GPU("Intel", "A737230JV", "Intel", "9200", true, 8);
                        break;
                    case ("GTX1650"):
                        comp.gpu = new GPU("Intel", "7376130FN", "Intel", "9200", true, 4);
                        break;
                    case ("GTX1050Ti"):
                        comp.gpu = new GPU("Intel", "761129A1V", "Intel", "9200", true, 2);
                        break;

                    default: throw new Exception("Укажите модель видеокарты");

                }


                //ПРОЦЕССОР
                switch (comboBox6.Text)
                {
                    case ("I7"):
                        comp.processor = new Processor("Intel", "I789A73761", "INTEL_CORE", 16, 9200, 13000, "64", CacheSize.L1);
                        break;
                    case ("I5"):
                        comp.processor = new Processor("Intel", "23FJKDFNO8", "INTEL_CORE", 8, 9200, 13000, "64", CacheSize.L1);
                        break;
                    case ("I3"):
                        comp.processor = new Processor("Intel", "DFNO873761", "INTEL_CORE", 4, 9200, 13000, "64", CacheSize.L1);
                        break;
                    default: throw new Exception("Укажите модель процессора");

                }

                //ТИП ПАМЯТИ
                switch (comboBox5.Text)
                {
                    case ("DDR"):
                        comp.RAMtype = "DDR";
                        break;
                    case ("DDR2"):
                        comp.RAMtype = "DDR2";
                        break;
                    case ("DDR3"):
                        comp.RAMtype = "DDR3";
                        break;
                    case ("DDR4"):
                        comp.RAMtype = "DDR4";
                        break;
                    case ("DDR5"):
                        comp.RAMtype = "DDR5";
                        break;

                    default: throw new Exception("Укажите тип памяти");


                }

                Complist.Add(comp);
                MessageBox.Show("Объект добавлен");

                //Состояние
                toolStripStatusLabel5.Text = Convert.ToString(Complist.Count);
                toolStripStatusLabel7.Text = "Добавление элемента";


                //добавляем состояние в UndoRedoHandler
                undoRedoHandler.OperationAdd(Operations.Add);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            comboBox3.Text = string.Empty;
            comboBox4.Text = string.Empty;
            comboBox5.Text = string.Empty;
            comboBox6.Text = string.Empty;
            textBox8.Text = string.Empty;
            textBox9.Text = string.Empty;
            radioButton8.Checked = false;
            radioButton9.Checked = false;
            listBox1.Text = string.Empty;


            //состояние
            toolStripStatusLabel7.Text = "Обновление формы";
        }



        // Сериализация в xml-файл
        private void button3_Click(object sender, EventArgs e)
        {
            if (Complist.Count == 0)
            {
                MessageBox.Show("Коллекция пуста");
            }
            else
            {
                using (FileStream stream = new FileStream(filePath, FileMode.OpenOrCreate))
                {
                    xmlSerializer.Serialize(stream, Complist);
                    MessageBox.Show("Сериализация выполнена");
                }
            }

            //состояние
            toolStripStatusLabel7.Text = "Сериализация";
        }



        //Десериализация из xml
        private void button4_Click(object sender, EventArgs e)
        {
            Complist.Clear();
            using (var reader = new StreamReader(filePath))
            {
                // Десериализуем коллекцию из файла
                var compobjects = (List<Computer>)xmlSerializer.Deserialize(reader);
                // Используем коллекцию

                foreach (Computer elem in compobjects)
                {
                    Complist.Add(elem);
                    
                }
            }


            //состояние
            toolStripStatusLabel5.Text = Convert.ToString(Complist.Count);
            toolStripStatusLabel7.Text = "Десериализация";
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        //вывод списка
        private void button6_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            foreach (Computer elem in Complist)
            {
                listBox1.Items.Add(elem);
            }

            //состояние
            toolStripStatusLabel7.Text = "Вывод списка";
        }


        //очистить листбокс
        private void button7_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            //состояние
            toolStripStatusLabel7.Text = "Очистка меню вывода";
        }



        //очистить файл xml
        private void button8_Click(object sender, EventArgs e)
        {





        DialogResult result = MessageBox.Show(
        "Вы уверены?",
        "Сообщение",
        MessageBoxButtons.YesNo,
        MessageBoxIcon.Information,
        MessageBoxDefaultButton.Button1,
        MessageBoxOptions.DefaultDesktopOnly);

            if (result == DialogResult.Yes)
            {
                using (FileStream stream = new FileStream(filePath, FileMode.Truncate))
                {
                    List<Computer> emptycomps = new List<Computer>();

                    xmlSerializer.Serialize(stream,emptycomps);
                }


                MessageBox.Show("xml файл очистился!");

            }

            //состояние
            toolStripStatusLabel7.Text = "Очистка файла";
        }

        private void оПрограммеToolStripMenuItem_Click(object sender, EventArgs e)
        {
        DialogResult result = MessageBox.Show(
        "Версия 1.0 \n Разработчик: Маркович С.В.",
        "Сообщение",
        MessageBoxButtons.OK,
        MessageBoxIcon.Information,
        MessageBoxDefaultButton.Button1,
        MessageBoxOptions.DefaultDesktopOnly);
        }

        private void поискToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SearchSubWindow searchsub = new SearchSubWindow();
            searchsub.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void стоимостиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            RamSizeFilter filter = new RamSizeFilter();
            filter.Show();
        }

        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripStatusLabel3_Click(object sender, EventArgs e)
        {

        }

        private void toolStripStatusLabel2_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            SearchSubWindow searchsub = new SearchSubWindow();
            searchsub.Show();
        }

        private void сортировкаПоToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            RamSizeFilter filter = new RamSizeFilter();
            filter.Show();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            comboBox3.Text = string.Empty;
            comboBox4.Text = string.Empty;
            comboBox5.Text = string.Empty;
            comboBox6.Text = string.Empty;
            textBox8.Text = string.Empty;
            textBox9.Text = string.Empty;
            radioButton8.Checked = false;
            radioButton9.Checked = false;
            listBox1.Text = string.Empty;


            //состояние
            toolStripStatusLabel7.Text = "Обновление формы";
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if(Complist.Count == 0)
                throw new Exception("Коллекция уже пуста");
            else
            {
                Complist.RemoveAt(Complist.Count - 1);
                MessageBox.Show("Последний элемент коллекции удален");
            }
            //состояние
            toolStripStatusLabel5.Text = Convert.ToString(Complist.Count);
            toolStripStatusLabel7.Text = "Удаление последнего элемента";

        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            undoRedoHandler.Undo(Complist);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            undoRedoHandler.Redo(Complist);
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
