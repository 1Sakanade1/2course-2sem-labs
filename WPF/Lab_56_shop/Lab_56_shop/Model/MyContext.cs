using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls.Primitives;

namespace Lab_56_shop
{
    public class MyContext : DbContext
    {
        public MyContext() : base("name=DefaultConnection") { }

        public DbSet<Product> products { get; set; }
 

    }
}
