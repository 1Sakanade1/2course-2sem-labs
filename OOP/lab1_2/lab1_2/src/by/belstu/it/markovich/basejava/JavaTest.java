

package by.belstu.it.markovich.basejava;

import jdk.jshell.spi.SPIResolutionException;

import java.lang.reflect.Array;
import java.util.Objects;
import java.util.SortedMap;
import java.util.Spliterator;

import static java.lang.Math.*;

/**
 * @author Markovich
 * @version 1.0
 * */
public class JavaTest {
    final int intconst1;
    public final int intconst2;
    public static final int intconst3 = 2;

    public JavaTest(int intconst1, int intconst2) {
        this.intconst1 = intconst1;
        this.intconst2 = intconst2;
    }


    /**
     * @return
     * @throws
     * @param
     * */
    public static void main(String[] args) {

        /**
         * @value 'x'
         * @see
         * */
        char var_char = 'x' ;
        int  var_int = 123;
        short var_short = 32;
        byte var_byte = 11;
        long var_long = 12345;
        boolean var_bool = true;
        String var_str = "zxc";
        double var_double = 123.321f;

        System.out.println(var_str  + var_int);

        System.out.println(var_str  + var_char);

        System.out.println(var_str  + var_double);

        var_byte +=var_int;

        System.out.println(var_byte);

        //var_int = var_double + var_long;

        var_long = var_int + 2147483647;

        System.out.println(var_long);

        //static int sint = 1 ;

       boolean var_bool2 = var_bool && var_bool;

        System.out.println(var_bool2);

        boolean var_bool3 = var_bool ^ var_bool;

        System.out.println(var_bool3);

        //boolean var_bool4 = var_bool + var_bool;

        //подберите типы для чисел 9223372036854775807 и
        //0x7fff_ffff_fff лонг и стринг

        //проинициализируйте и выведите char - 'a' ; \u0061'; 97; после
        //чего сложите все char.

        char var_char1 = 'a';

        char var_char2 = '\u0061';

        char var_char3 = 97;

        System.out.println(var_char1 + var_char2 + var_char3);

        System.out.println(3.45 % 2.4);

        System.out.println(1.0 % 0.0);

        System.out.println(0.0 % 0.0);

        System.out.println(log(-345));

        System.out.println(Float.intBitsToFloat(0x7F800000));

        System.out.println(Float.intBitsToFloat(0xFF800000));

        System.out.println((round(PI)));

        System.out.println((round(E)));

        System.out.println(min((E),(PI)));

        System.out.println(random());

        //Создать объекты разных классов оболочек (Boolean,
        //Character, Integer, Byte, Short, Long, Double)
        // выполните на ними арифметические, логические и битовые
        //операторы (, >>>, >>, ~, &, *, -, +) – выборочно
        // веведите MIN_VALUE и MAX_VALUE для Long и Double
        // выполнить упарковку и распаковку для типов Integer и Byte
        // вызовите для Integer методы : parseInt ; toHexString ; compare ;
        //toString ; bitCount ; isNaN …

        Character var_Charact = 'a';
        Integer var_Integer = 123;
        Byte var_Byte = 12;
        Short var_Short = 45;
        Long var_Long_2 = Long.valueOf(1234);

        System.out.println(~var_Byte);

        System.out.println(var_Byte>>>1);

        System.out.println(Long.MIN_VALUE);

        System.out.println(Long.MAX_VALUE);

        System.out.println(Double.MIN_VALUE);

        System.out.println(Double.MAX_VALUE);


        //Автоупаковка
        Integer intpack = 9;

        Byte bytepack = 12;

        //Распаковка
        int in = 0;
        in = intpack;

        byte bp = 0;

        bp = bytepack;



        Integer testint = Integer.parseInt("11234");

        System.out.print(Integer.toHexString(15)); // F

        System.out.print(Integer.compare(1,4));

        String teststr = Integer.toString(234);

        Integer bitint = 10;

        System.out.println(Integer.bitCount(bitint)); // 10 == 1010 => result = 2

        System.out.println(Double.isNaN(12));



        //Выполните преобразование числа типа String (String s34 = "2345";)
        //к int , используя: конструктор, valueOf, parse….
        // переводите строку в массив байтов и обратно из массива байтов в
        //строку
        // преобразуйте строку в логический тип 2-мя способами.
        // определите два строки (String) с одинаковыми инициализаторами.
        //Выполите ==, equals, compareTo. В чем разница, поясните
        //результат. Одной из строк присвойте null. Повторите все тир
        //варианта сравнения.
        // для произвольной строки выполните функции split, contains,
        //hashCode, indexOf, length, replace.

        String s34 = "2345";

        int i34 = Integer.valueOf(s34);



        char[] charmas =  s34.toCharArray();

        String s35 = charmas.toString();

        String strue = "true";

        Boolean bool1 = Boolean.parseBoolean(strue);

        bool1 = Boolean.valueOf(strue);

        String s1 = "zxc";

        String s2 = "zxc";

        System.out.println();

        System.out.println("------------");

        System.out.println(s1 == s2);

        System.out.println(s1.equals(s2));

        System.out.println(s1.compareTo(s2));

        s2 = null;

        System.out.println(s1 == s2);

        System.out.println(s1.equals(s2));

        //System.out.println(s1.compareTo(s2));


        System.out.println("------------");

        String teststring = "hello world";

        String[] words = teststring.split(" ");
        for (String word : words) {
            System.out.println(word);
        }

        System.out.println(teststring.contains("hel"));

        System.out.println(teststring.hashCode());

        System.out.println(teststring.indexOf('l'));

        System.out.println(teststring.length());

        System.out.println(teststring.replace("hel","zxc"));


        //g) Проверьте какая из форм объявлений многомерного массива
        //допустима

        char c1[][] = {{}};

        int [] [] c ;
        c = new int [ 2 ] [];

        c [ 0 ] = new int [1];
        c [ 1 ] = new int [2];



        char c2 = '1';
        char c3 = '2';


        //boolean comRez = (с2==с3);
        //с2 = с3;

        char[]  arrch = {'1','2','a'};

        for (char elem : arrch)
        {
            System.out.println(elem);
        }


        WrapperString wrapstr = new WrapperString("zxcstr");

        wrapstr.replace('z','x');

        //TODO add anonim class

        //Определите анонимный класс с переопредленной
        //реализацией replace (char oldchar, char newchar)
        //и дополнительным методом delete (char newchar)
    }
}

// Создайте класс WrapperString c приватным полем типа String.
// Используя Code->Generate (Alt+Insert) сгенерируйте
//выделенные методы


class WrapperString{

    private String stroka;

    public String getStroka() {
        return stroka;
    }

    public void setStroka(String stroka) {
        this.stroka = stroka;
    }

    public WrapperString(String stroka) {
        this.stroka = stroka;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WrapperString that = (WrapperString) o;
        return Objects.equals(stroka, that.stroka);
    }

    @Override
    public int hashCode() {
        return Objects.hash(stroka);
    }

    @Override
    public String toString() {
        return "WrapperString{" +
                "stroka='" + stroka + '\'' +
                '}';
    }

    public void replace (char oldchar, char newchar)
    {
        String resstr =  stroka.replace(oldchar, newchar);

        this.stroka = resstr;
    }


}
