package by.belstu.it.markovich;

public class WrapperString {
    private String str;
    public WrapperString(String str)
    {
        this.str = str;
    }
    public String getStr()
    {
        return str;
    }
    public void setStr(String str)
    {
        this.str = str;
    }
    public void replace(char oldChar, char newChar)
    {
        str = str.replace(oldChar,newChar);
    }
    public void delete(char delChar)
    {
        str = str.replace(delChar, ' ');
    }

}



