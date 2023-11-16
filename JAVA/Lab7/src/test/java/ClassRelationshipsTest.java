import org.testng.annotations.Test;

class A {
    private int a;

    public A(int a) {
        this.a = a;
    }

    public int getA() {
        return a;
    }

    public int setA(int i){return i;}
}






class B {
    private A a;

    public B(A a) {
        this.a = a;
    }

    public int getValueFromA() {
        return a.getA();
    }
}

public class ClassRelationshipsTest {

    @Test
    public void testGetValueFromA() {
        A a = new A(10);
        B b = new B(a);
        assert b.getValueFromA() == 10;
    }

}