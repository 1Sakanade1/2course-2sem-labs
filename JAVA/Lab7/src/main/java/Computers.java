
public class Computers extends Devices{
    public String model;
    public int amount;

    public String getModel() {
        return model;
    }

    public int getAmount() {
        return amount;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Computers(String pcmodel, int amount) {
        this.model = pcmodel;
        this.amount = amount;
    }

    public void GetAmount(){
        System.out.println(this.amount);
    }
}
