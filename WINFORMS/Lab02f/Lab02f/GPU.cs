using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


//Дополнительно: Агрегируемый объект «Видеокарта». Поля: 
//производитель, серия, модель, частота, поддержка DiretX11,
//объем памяти.

namespace Lab02f
{
    public class GPU
    {
        public string manufacturer { get; set; }
        public string serialNumber { get; set; }
        public string publichser { get; set; }
        public string frequency { get; set; }
        public bool DirectX11Supporting { get; set; }
        public int MemorySize { get; set; }

        public GPU(string _manufacturer, string _serialNumber, string _publichser, string _frequency, bool _directX11Supporting, int _memorySize)
        {
            this.manufacturer = _manufacturer;
            this.serialNumber = _serialNumber;
            this.publichser = _publichser;
            this.frequency = _frequency;
            DirectX11Supporting = _directX11Supporting;
            MemorySize = _memorySize;
        }

        public GPU() { }
    }
}
