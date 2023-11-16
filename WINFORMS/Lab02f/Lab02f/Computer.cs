using Lab02f;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public enum ComputerType
{
    server,
    workstation,
    laptop,
    personalComputer
}





namespace Lab02f
{

    [Serializable]
    public class Computer
    {
        public ComputerType type { get; set; }
        public GPU gpu { get; set; }
        public int RAMamount { get; set; }
        public string RAMtype { get; set; }
        public int hardSpace { get; set; }
        public string hardType { get; set; }
        public string date { get; set; }
        public Processor processor { get; set; }
        public int price { get; set; }


        public Computer(ComputerType type, GPU gpu, int rAMamount, string rAMtype, int hardSpace, string hardType, string date, Processor processor, int price)
        {
            this.type = type;
            this.gpu = gpu;
            RAMamount = rAMamount;
            RAMtype = rAMtype;
            this.hardSpace = hardSpace;
            this.hardType = hardType;
            this.date = date;
            this.processor = processor;
            this.price = price;
        }

        public Computer() { }

        public void GetInfo()
        {
            Console.WriteLine(this.type);
            Console.WriteLine(this.gpu);
            Console.WriteLine(this.RAMamount);
            Console.WriteLine(this.RAMtype);
            Console.WriteLine(this.hardSpace);
            Console.WriteLine(this.hardType);
            Console.WriteLine(this.date);
            Console.WriteLine(this.processor);
            Console.WriteLine(this.price);
            Console.WriteLine("---------------------");
        }


    }
}







//IT лаборатория. Объект «Компьютер». Поля: тип компьютера 
//(сервер, рабочая станция, ноутбук …..), процессор, видеокарта,
//размер и тип ОЗУ, размер и тип жесткого диска, дата 
//приобретения и т.д. Агрегируемый объект «Процессор» - поля: 
//производитель, серия, модель, количество ядер процессора,
//частота, максимальная частота, разрядность архитектуры, размер 
//кэша L1-L3.
//Дополнительно: Агрегируемый объект «Видеокарта». Поля: 
//производитель, серия, модель, частота, поддержка DiretX11,
//объем памяти.
//Исходя из введенных данных рассчитайте стоимость 
//компьютера и всей лаборатории (предложите формулу)