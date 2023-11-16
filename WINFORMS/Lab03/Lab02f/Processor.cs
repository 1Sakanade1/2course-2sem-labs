using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab02f
{
    public enum CacheSize
    {
        L1,
        L2,
        L3
    }



    public class Processor
    {
        public string manufacturer { get; set; }
        public string serialNumber { get; set; }
        public string model { get; set; }
        public int coreAmount { get; set; }
        public int frequency { get; set; }
        public int maxFrequency { get; set; }
        public string architectureBitness { get; set; }
        public CacheSize cacheSize { get; set; }

        public Processor(string _manufacturer, string _serialNumber, string _model, int _coreAmount, int _frequency, int _maxFrequency,
                  string _architectureBitness, CacheSize _cacheSize)
        {
            this.manufacturer = _manufacturer;
            this.serialNumber = _serialNumber;
            this.model = _model;
            this.coreAmount = _coreAmount;
            this.frequency = _frequency;
            this.maxFrequency = _maxFrequency;
            this.architectureBitness = _architectureBitness;
            this.cacheSize = _cacheSize;
        }

        public Processor() { }

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