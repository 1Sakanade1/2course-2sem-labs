using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_56_shop
{
    public class Product
    {
        [Key]
        public string product_name { get; set; }

        public string product_description { get; set; }

        public int price { get; set; }

        public string imagepath { get; set; }
    }
}
