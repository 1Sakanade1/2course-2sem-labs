namespace Lab02f
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.button5 = new System.Windows.Forms.Button();
            this.textBox9 = new System.Windows.Forms.TextBox();
            this.label25 = new System.Windows.Forms.Label();
            this.comboBox6 = new System.Windows.Forms.ComboBox();
            this.label24 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.radioButton8 = new System.Windows.Forms.RadioButton();
            this.radioButton9 = new System.Windows.Forms.RadioButton();
            this.label22 = new System.Windows.Forms.Label();
            this.textBox8 = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.comboBox5 = new System.Windows.Forms.ComboBox();
            this.label20 = new System.Windows.Forms.Label();
            this.comboBox4 = new System.Windows.Forms.ComboBox();
            this.label19 = new System.Windows.Forms.Label();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.label18 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(247, 411);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(125, 27);
            this.button5.TabIndex = 85;
            this.button5.Text = "Завершить";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // textBox9
            // 
            this.textBox9.Location = new System.Drawing.Point(247, 239);
            this.textBox9.Name = "textBox9";
            this.textBox9.Size = new System.Drawing.Size(125, 22);
            this.textBox9.TabIndex = 84;
            this.textBox9.TextChanged += new System.EventHandler(this.textBox9_TextChanged);
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Location = new System.Drawing.Point(244, 220);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(77, 16);
            this.label25.TabIndex = 83;
            this.label25.Text = "Стоимость";
            // 
            // comboBox6
            // 
            this.comboBox6.FormattingEnabled = true;
            this.comboBox6.Items.AddRange(new object[] {
            "I7",
            "I5",
            "I3"});
            this.comboBox6.Location = new System.Drawing.Point(187, 180);
            this.comboBox6.Name = "comboBox6";
            this.comboBox6.Size = new System.Drawing.Size(125, 24);
            this.comboBox6.TabIndex = 82;
            this.comboBox6.SelectedIndexChanged += new System.EventHandler(this.comboBox6_SelectedIndexChanged);
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Location = new System.Drawing.Point(187, 161);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(79, 16);
            this.label24.TabIndex = 81;
            this.label24.Text = "Процессор";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Location = new System.Drawing.Point(21, 220);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(127, 16);
            this.label23.TabIndex = 80;
            this.label23.Text = "Дата поступления";
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(21, 239);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 79;
            this.monthCalendar1.DateChanged += new System.Windows.Forms.DateRangeEventHandler(this.monthCalendar1_DateChanged);
            // 
            // radioButton8
            // 
            this.radioButton8.AutoSize = true;
            this.radioButton8.Location = new System.Drawing.Point(247, 124);
            this.radioButton8.Name = "radioButton8";
            this.radioButton8.Size = new System.Drawing.Size(58, 20);
            this.radioButton8.TabIndex = 78;
            this.radioButton8.TabStop = true;
            this.radioButton8.Text = "HDD";
            this.radioButton8.UseVisualStyleBackColor = true;
            this.radioButton8.CheckedChanged += new System.EventHandler(this.radioButton8_CheckedChanged);
            // 
            // radioButton9
            // 
            this.radioButton9.AutoSize = true;
            this.radioButton9.Location = new System.Drawing.Point(190, 124);
            this.radioButton9.Name = "radioButton9";
            this.radioButton9.Size = new System.Drawing.Size(56, 20);
            this.radioButton9.TabIndex = 77;
            this.radioButton9.TabStop = true;
            this.radioButton9.Text = "SSD";
            this.radioButton9.UseVisualStyleBackColor = true;
            this.radioButton9.CheckedChanged += new System.EventHandler(this.radioButton9_CheckedChanged);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(187, 103);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(73, 16);
            this.label22.TabIndex = 76;
            this.label22.Text = "Тип диска\r\n";
            // 
            // textBox8
            // 
            this.textBox8.Location = new System.Drawing.Point(187, 55);
            this.textBox8.Name = "textBox8";
            this.textBox8.Size = new System.Drawing.Size(125, 22);
            this.textBox8.TabIndex = 75;
            this.textBox8.TextChanged += new System.EventHandler(this.textBox8_TextChanged);
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(187, 36);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(92, 16);
            this.label21.TabIndex = 74;
            this.label21.Text = "Объём диска";
            // 
            // comboBox5
            // 
            this.comboBox5.FormattingEnabled = true;
            this.comboBox5.Items.AddRange(new object[] {
            "DDR",
            "DDR2",
            "DDR3",
            "DDR4",
            "DDR5"});
            this.comboBox5.Location = new System.Drawing.Point(21, 180);
            this.comboBox5.Name = "comboBox5";
            this.comboBox5.Size = new System.Drawing.Size(125, 24);
            this.comboBox5.TabIndex = 73;
            this.comboBox5.SelectedIndexChanged += new System.EventHandler(this.comboBox5_SelectedIndexChanged);
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(21, 161);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(108, 16);
            this.label20.TabIndex = 72;
            this.label20.Text = "Тип Оп. Памяти";
            // 
            // comboBox4
            // 
            this.comboBox4.FormattingEnabled = true;
            this.comboBox4.Items.AddRange(new object[] {
            "RTX2060",
            "GTX1050Ti",
            "GTX1650"});
            this.comboBox4.Location = new System.Drawing.Point(21, 120);
            this.comboBox4.Name = "comboBox4";
            this.comboBox4.Size = new System.Drawing.Size(125, 24);
            this.comboBox4.TabIndex = 71;
            this.comboBox4.SelectedIndexChanged += new System.EventHandler(this.comboBox4_SelectedIndexChanged);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(21, 101);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(86, 16);
            this.label19.TabIndex = 70;
            this.label19.Text = "Видеокарта";
            // 
            // comboBox3
            // 
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Items.AddRange(new object[] {
            "server",
            "workstation",
            "laptop",
            "personal"});
            this.comboBox3.Location = new System.Drawing.Point(21, 55);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(125, 24);
            this.comboBox3.TabIndex = 69;
            this.comboBox3.SelectedIndexChanged += new System.EventHandler(this.comboBox3_SelectedIndexChanged);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(21, 36);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(32, 16);
            this.label18.TabIndex = 68;
            this.label18.Text = "Тип";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(21, 9);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(80, 16);
            this.label17.TabIndex = 67;
            this.label17.Text = "Компьютер\n";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(247, 274);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(125, 27);
            this.button1.TabIndex = 86;
            this.button1.Text = "Добавить";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(247, 306);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(125, 27);
            this.button2.TabIndex = 87;
            this.button2.Text = "Обновить";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(247, 339);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(125, 27);
            this.button3.TabIndex = 88;
            this.button3.Text = "Сериализовать";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(247, 372);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(125, 27);
            this.button4.TabIndex = 89;
            this.button4.Text = "Десериализовать";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 16;
            this.listBox1.Location = new System.Drawing.Point(390, 55);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(209, 148);
            this.listBox1.TabIndex = 90;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(390, 215);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(125, 27);
            this.button6.TabIndex = 91;
            this.button6.Text = "Вывести список элементов";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(390, 248);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(125, 27);
            this.button7.TabIndex = 92;
            this.button7.Text = "Очистить\r\n";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // button8
            // 
            this.button8.Location = new System.Drawing.Point(390, 306);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(125, 27);
            this.button8.TabIndex = 93;
            this.button8.Text = "Очистить файл";
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(611, 450);
            this.Controls.Add(this.button8);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.textBox9);
            this.Controls.Add(this.label25);
            this.Controls.Add(this.comboBox6);
            this.Controls.Add(this.label24);
            this.Controls.Add(this.label23);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.radioButton8);
            this.Controls.Add(this.radioButton9);
            this.Controls.Add(this.label22);
            this.Controls.Add(this.textBox8);
            this.Controls.Add(this.label21);
            this.Controls.Add(this.comboBox5);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.comboBox4);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.comboBox3);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.label17);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox textBox9;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.ComboBox comboBox6;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.RadioButton radioButton8;
        private System.Windows.Forms.RadioButton radioButton9;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.TextBox textBox8;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.ComboBox comboBox5;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.ComboBox comboBox4;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button8;
    }
}

