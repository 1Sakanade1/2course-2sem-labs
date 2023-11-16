

import java.io.Serializable;

public class Person implements  IPerson, Serializable {
    public String name;
    public Integer age;
    public gender gender;

    public position pos;

    public Integer salary;

    public void setname(String name) {
        this.name = name;
    }

    public void setage(int age) {
        this.age = age;
    }

    public String getname() {
        return name;
    }

    public int getage() {
        return age;
    }


    public Person(String name, Integer age, gender gender, position pos,Integer salary) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.pos = pos;
        this.salary = salary;
    }

    public Person(){

    }

    public void GetInfo(){
        System.out.println(this.name + " " + this.age + " " + this.pos);
    }

    public Integer GetSalary(){
        return this.salary;
    }

}
