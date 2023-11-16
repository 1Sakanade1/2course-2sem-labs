using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab02f
{
    internal static class Program
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            //        Processor(string _manufacturer, string _serialNumber, string _model, int _coreAmount, int _frequency, int _maxFrequency,
            //                  string _architectureBitness, CacheSize _cacheSize)

            Processor I7 = new Processor("Intel", "I789A73761", "INTEL_CORE", 16, 9200, 13000, "64", CacheSize.L1);
            Processor I5 = new Processor("Intel", "23FJKDFNO8", "INTEL_CORE", 8, 9200, 13000, "64", CacheSize.L1);
            Processor I3 = new Processor("Intel", "DFNO873761", "INTEL_CORE", 4, 9200, 13000, "64", CacheSize.L1);

            //public GPU(string _manufacturer, string _serialNumber, string _publichser, string _frequency, bool _directX11Supporting, int _memorySize)

            GPU RTX2060 = new GPU("Intel", "A737230JV", "Intel", "9200", true, 8);
            GPU GTX1650 = new GPU("Intel", "7376130FN", "Intel", "9200", true, 4);
            GPU GTX1050Ti = new GPU("Intel", "761129A1V", "Intel", "9200", true, 2);

            

                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new Form1());


        }
    }
}
