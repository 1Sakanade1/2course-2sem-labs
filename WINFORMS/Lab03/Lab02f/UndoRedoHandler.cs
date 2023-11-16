using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

enum Operations
{
    Add,
    Refresh,
    Serialize,
    Deserialize,
    Clear_file,
    Print,
    ClearListBox
}





namespace Lab02f
{

    internal class UndoRedoHandler
    {
       public List<Computer> removedItems;

        public  Stack<Operations> operations;

        public  Stack<Operations> undoOperations;

        public UndoRedoHandler()
        {
            operations = new Stack<Operations>();
            undoOperations = new Stack<Operations>();
            removedItems = new List<Computer>();
        }

        public void Undo(List<Computer> Complist)
        {
            try
            {
                if (operations.Count == 0)
                {
                    throw new Exception("Стек операций пуст");
                }
                undoOperations.Push(operations.Peek());
                switch (operations.Pop())
                {
                    case Operations.Add:
                        this.UndoAdd(Complist);
                        break;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }
        public void Redo(List<Computer> Complist)
        {
            try
            {
                if (undoOperations.Count == 0)
                {
                    throw new Exception("Стек отмененных операций пуст");
                }
                operations.Push(undoOperations.Peek());
                switch (undoOperations.Pop())
                {

                    case Operations.Add:
                        this.RedoAdd(Complist);
                        break;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }
        //ADD IN OPERATION STACK

        public void OperationAdd(Operations operation)
        {
            this.operations.Push(operation);
        }




        //OPERATION ADD
        public void UndoAdd(List<Computer> Complist)
        {
            try
            {
                if (Complist.Count == 0)
                {
                    throw new Exception("Коллекция пуста");
                }

                removedItems.Add(Complist.Last());
                Complist.RemoveAt(Complist.Count - 1);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void RedoAdd(List<Computer> Complist)
        {
            try
            {
                if (removedItems.Count == 0)
                {
                    throw new Exception("Вы не добавляли элемент!");
                }

                Complist.Add(Complist.Last());
                removedItems.RemoveAt(Complist.Count - 1);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


    }
}
