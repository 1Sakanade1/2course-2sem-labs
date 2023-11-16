using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab02f
{
    public class Laboratory
    {
        public List<Computer> computers;


        public void GetPrice()
        {
            int price = 0;

            int counter = 1;

            foreach (Computer computer in computers)
            {
                Console.WriteLine($"стоимость компьютера {counter} = {computer.price}");
                counter++;

                price += computer.price;

            }

            Console.WriteLine($"Общая стоимость компьютеров = {price} ");
        }

    }
}
