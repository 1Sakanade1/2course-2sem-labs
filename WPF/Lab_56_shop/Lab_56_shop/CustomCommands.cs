using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Lab_56_shop
{
    public static class CustomCommands
    {
        public static readonly RoutedUICommand ShowMessage = new RoutedUICommand(
            "Показать сообщение", "ShowMessage", typeof(CustomCommands));
    }
}

