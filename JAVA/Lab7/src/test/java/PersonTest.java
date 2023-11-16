

import org.testng.annotations.*;

import java.io.Serializable;
@Test()
public class PersonTest implements  IPerson, Serializable {

    @DataProvider
    public Object[][] data() {
        return new String[][] {new String[] {"John"}};
    }




    public String name;
    public Integer age;
    public gender gender;

    public position pos;

    public Integer salary;


    @Test(dataProvider = "data")
    public void setname(String name) {
        this.name = name;
    }
    @Test(enabled=false)
    public void setage(int age) {
        this.age = age;
    }

    @Test(timeOut = 2000)
    public String getname() {
        return name;
    }
    @Test()
    public int getage() {
        return age;
    }


    public PersonTest(String name, Integer age, gender gender, position pos,Integer salary) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.pos = pos;
        this.salary = salary;
    }

    public PersonTest(){

    }
    @Test()
    public void GetInfo(){
        System.out.println(this.name + " " + this.age + " " + this.pos);
    }

    @Test()
    public Integer GetSalary(){
        return this.salary;
    }


    @BeforeTest
    public void SendStartNotification(){

        System.out.println("Test started");

    }

    @AfterTest
    public void SendFinalNotification(){

        System.out.println("Test completed");

    }

    @BeforeMethod
    public void before_method()
    {
        System.out.println("Start Testing Some Method");
    }


}
