using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace lab1_f
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            double weight = 0;
            double height = 0;
            double age = 0;
            double wantedWeight = 0;
            double Time = 0;

            double KaloriesResult = 0;

            double GenderKoef = 0;
            double ProgramKoef = 0;

            try { 

            if (textBox1.Text.Length == 0 && textBox2.Text.Length == 0 && textBox3.Text.Length == 0 && textBox4.Text.Length == 0 && textBox5.Text.Length == 0)
            {
                    throw new Exception("Укажите все данные");
            }
            else {
                weight = Convert.ToDouble(textBox1.Text);

                if(weight < 0)
                    {
                        
                    }

                height = Convert.ToDouble(textBox2.Text);


                    if (height < 0)
                    {
                        throw new Exception("неверно указан вес!");
                    }

                    age = Convert.ToDouble(textBox3.Text);

                wantedWeight = Convert.ToDouble(textBox4.Text);

                Time = Convert.ToDouble(textBox5.Text);
            }

            }
            catch (Exception ex)
            {
                MessageBox.Show($"{ex.Message}");
            }

            switch (comboBox1.Text)
            {
                case "Муж.":

                    GenderKoef = 1.15;

                    break;

                case "Жен.":

                    GenderKoef = 0.95;

                    break;

                default:

                    MessageBox.Show("Выберите пол!");

                    break;
            }

            switch(comboBox2.Text)
            {
                case "поддержание веса и размеров":

                    ProgramKoef = 1;

                    break;

                case "снижение веса":

                    ProgramKoef = 0.75;

                    break;

                case "увеличение веса":

                    ProgramKoef = 1.1;

                    break;

                default:

                    MessageBox.Show("Выберите программу!");

                    break;

                    
            }

            if (height - weight - 100 < 20)
            {
                textBox7.Text = "недостаток веса";
            }
            else if(height - weight - 100 > 20)
            {
                textBox7.Text = "Ожирение";
            }
            else
            {
                textBox7.Text = "Вес в норме";
            }

            CaloriesCalc caloriesCalc = new CaloriesCalc();

            if (caloriesCalc.Calculate(height, wantedWeight, weight, GenderKoef, ProgramKoef, age) != 0||KaloriesResult !=double.NaN)
            {
                textBox6.Text = caloriesCalc.Calculate(height, wantedWeight, weight, GenderKoef, ProgramKoef, age).ToString();
            }
            else
            {
                textBox6.Text = "";
            }


        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            comboBox1.Text = "";
            comboBox2.Text = "";
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
            textBox7.Text = "";
        }
    }

    public interface ICalculator
    {
        int Calculate(double height, double wantedWeight, double weight, double GenderKoef, double ProgramKoef, double age);
    }

    class CaloriesCalc : ICalculator
    {
        public int Calculate(double height, double wantedWeight, double weight, double GenderKoef, double ProgramKoef, double age)
        {
            double KaloriesResult;


            KaloriesResult = Math.Abs(1700 * height / 100 * (wantedWeight / weight) * GenderKoef * ProgramKoef);

            KaloriesResult += Math.Round(KaloriesResult * age / 400);




            return Convert.ToInt32(KaloriesResult);
        }



    }



}
