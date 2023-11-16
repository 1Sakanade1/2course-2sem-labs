using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Lab_56_shop
{

    public enum Operations
    {
        Add,
        Delete,
        Change
    }


    public class UndoRedoMemorizer
    {
        public Operations operationType;

        public String product_name = "";

        public String product_description = "";

        public int price = -1;

        public String imagepath = "";

        public UndoRedoMemorizer(Operations operationType, String product_name, String product_description,int price, String imagepath)
        {
            this.operationType = operationType;
            this.product_name = product_name;
            this.product_description = product_description;
            this.price = price;
            this.imagepath = imagepath;
        }

    }



    internal class UndoRedoHandler
    {

        DBHandler dbhandler = new DBHandler();

        public Stack<UndoRedoMemorizer> operations;
        public Stack<UndoRedoMemorizer> undoOperations;



        public void Undo()
        {
            try
            {
                if (operations.Count == 0)
                {
                    throw new Exception("Стек операций пуст");
                }
                undoOperations.Push(operations.Peek());
                UndoRedoMemorizer currentOperation = operations.Pop();
                UndoOperation(currentOperation);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }


        public void UndoOperation(UndoRedoMemorizer operation)
        {
            switch (operation.operationType)
            {
                case Operations.Add:
                    dbhandler.DeleteElement(operation.product_name);
                    break;

                case Operations.Delete:
                    dbhandler.InsertElement(operation.product_name, operation.product_description, Convert.ToString(operation.price), operation.imagepath);
                    break;
                case Operations.Change:
                    dbhandler.UpdateElement(operation.product_name, operation.product_description, Convert.ToString(operation.price), operation.imagepath);
                    break;


            }
        }

        public void Redo()
        {
            try
            {
                if (undoOperations.Count == 0)
                {
                    throw new Exception("Стек undo операций пуст");
                }
                operations.Push(undoOperations.Peek());
                UndoRedoMemorizer currentOperation = undoOperations.Pop();
                DoOperation(currentOperation);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void DoOperation(UndoRedoMemorizer operation)
        {
            switch (operation.operationType)
            {
                case Operations.Add:

                    dbhandler.InsertElement(operation.product_name, operation.product_description, Convert.ToString(operation.price), operation.imagepath);
                    break;

                case Operations.Delete:
                    dbhandler.DeleteElement(operation.product_name);
                    break;
                case Operations.Change:
                    dbhandler.UpdateElement(operation.product_name, operation.product_description, Convert.ToString(operation.price), operation.imagepath);
                    break;


            }
        }



    }
}
