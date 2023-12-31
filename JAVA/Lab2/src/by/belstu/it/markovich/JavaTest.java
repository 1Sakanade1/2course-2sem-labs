package by.belstu.it.markovich;


import java.io.UnsupportedEncodingException;

/**Лаба 2
 * @author Markovich Sviatoslav
 * @version 1.0.0
 */
public class JavaTest {
    public static double rnd(int min, double max)//Random
    {
        max -= min;
        return (double) (Math.random() * max) + min;
    }
    public static void main(String[] args) throws UnsupportedEncodingException {

        /**
         * @return
         * @throws
         * @param
         */

        System.out.println("B)---------------------------------------------------------");

        /**
         * @value
         * @see
         */

        char var_char_1 = 'a';
        int var_int_1 = 2;
        short var_short_1 = 10;
        byte var_byte_1 = 22;
        long var_long_1 = 2147483648L;
        boolean var_bool_1 = true;
        String var_str_1 = "zxc";
        double var_double_1 = 4.12;

        System.out.println("String + int = " + var_str_1 + var_int_1);
        System.out.println("String + char = " + var_str_1 + var_char_1);
        System.out.println("String + double = " + var_str_1 + var_double_1);
        byte byt2 = (byte) (var_byte_1 + var_int_1);
        System.out.println("byte+int = " + byt2);
        int xx = (int) (var_double_1 + var_long_1);
        System.out.println("Double+int = " + xx);
        long lon2 = var_int_1 + 2147483647L;
        System.out.println("int + 2147483647 = " + lon2);
        //static int sint;
        //System.out.println(sint);
        boolean bool2 = false, bool3;
        bool3 = bool2 && var_bool_1;
        System.out.println("True and false = " + bool3);
        bool3 = bool2 ^ var_bool_1;
        System.out.println("True or false = " + bool3);
        //bool3=bool2+bool; нельзя
        long lon3 = 9223372036854775807L;
        //long=0x7fff_ffff_fff;
        char ch1 = 'a', ch2 = '\u0061', ch3 = 97;
        System.out.println("ch1 = " + ch1);
        System.out.println("ch2 = " + ch2);
        System.out.println("ch3 = " + ch3);
        System.out.println("3.45 % 2.4 = " + 3.45 % 2.4);
        System.out.println("1.0 / 0.0 = " + 1.0 / 0.0);
        System.out.println("0.0 / 0.0 = " + 0.0 / 0.0);
        System.out.println("log(-345) = " + Math.log(-345));
        System.out.println("Float.intBitsToFloat(0x7F800000) = " + Float.intBitsToFloat(0x7F800000));
        System.out.println("Float.intBitsToFloat(0xFF800000) = " + Float.intBitsToFloat(0xFF800000));
        // целые константы можно записывать в двоичной, десятичной и шестнадцатиричной системах

        System.out.println("С)---------------------------------------------------------");

        final int MY_CONST = 777;
        final int MY_CONST2 = 100;
        //public static final int MY_CONST_3 = 11;
        System.out.println("Константа №1 = " + MY_CONST + " Константа №2 = " + MY_CONST2);


        System.out.println("D)---------------------------------------------------------");

        System.out.println("Pi = " + Math.PI);
        System.out.println("Exp = " + Math.E);
        System.out.println("Округление Pi = " + Math.round(Math.PI));
        System.out.println("Округление Exp = " + Math.round(Math.E));
        System.out.println("Минимальное число из Pi и Exp = " + Math.min(Math.PI, Math.E));

        System.out.println("E)---------------------------------------------------------");

        Boolean wrapBool = new Boolean(false);
        Boolean wrapBool2 = new Boolean( true );
        System.out.println(wrapBool& wrapBool2);

        char ch = '9';
        Character cl = new Character(ch);
        System.out.println("Character = " + ch);

        Integer aa = new Integer(6);//классы обертки
        Integer b = new Integer(1);
        System.out.println("Сдвиги Integer(>>>,<<,>>)");
        System.out.println(aa >>> b); // Беззнаковый сдвиг
        System.out.println(aa << b);
        System.out.println(aa >> b);

        System.out.println("Max value Long = "+Long.MAX_VALUE);
        System.out.println("Min value Long = "+Long.MIN_VALUE);

        System.out.println("Max value Double = "+Double.MAX_VALUE);
        System.out.println("Min value Double = "+Double.MIN_VALUE);

        Integer integer = 9; // упаковка
        int in = 0;
        in = new Integer(9); // распаковка

        Byte aaa =  127;//упаковка
        System.out.println("Упаковка " + aaa);
        Byte aaa2 = 0;
        aaa2 = new Byte((byte) 127);
        System.out.println("Распаковка " + aaa2);


        int par = Integer.parseInt("444", 16);
        System.out.println("ParseInt " + par);
        String hex = Integer.toHexString(10);
        System.out.println("toHexString " + hex);

        System.out.println("compare(100,100) = "+Integer.compare(100, 100));
        System.out.println("compare(101,100) = "+Integer.compare(101, 100));
        System.out.println("compare(100,101) = "+Integer.compare(100, 101));

        System.out.println("toString() = "+Integer.toString(1002));

        System.out.println(("bitCount(100) = " + Integer.bitCount(100)));

        //System.out.println("isNaN() = "+ Integer.isNaN(1002));


        System.out.println("F)---------------------------------------------------------");

        String s34 = "2345";
        int s35 = Integer.parseInt(s34);
        System.out.println("Преобразование String в int = "+s35);
        Integer i2 = Integer.valueOf(s34);
        System.out.println("Преобразование через valueof String в int = "+i2);
        Integer i1 = new Integer("2345");
        System.out.println("Преобразование через конструктор String в int = "+i1);

        byte[] arr =s34.getBytes("UTF-8");
        System.out.println("переводит строки в массив байтов = "+arr);
        String st = new String(arr,"UTF-8");
        System.out.println("переводит  массив байтов в строку = "+st);

        boolean bool1,  bool1_2;
        //с использованием метода parseBoolean
        bool1 = Boolean.parseBoolean(s34);
        System.out.println("String в bool by parseBoolean ="+bool1 );
        //c использованием метода valueOf
        bool1_2 = Boolean.valueOf(s34);
        System.out.println("String в bool by vaalueof ="+ bool1_2 );   //возрващает объект булеан

        String string1 = "привет";
        String string2 = "привет";
        System.out.println(string1==string2);
        System.out.println("Equals? "+string1.equals(string2));
        System.out.println("CompareTo = "+string1.compareTo(string2));
        string2 = null;
        System.out.println("===string2 = null===");
        System.out.println(string1==string2);
        System.out.println("Equals? "+string1.equals(string2));
       // System.out.println("CompareTo = "+string1.compareTo(string2));

        String str2 = "Hello@Java@World";
        String [] arrOfStr = str2.split("@");
        for (String ac : arrOfStr)
            System.out.print(" "+ac);

        String name="what do you know about me";// содержит ли одна строка другую
        System.out.println(name.contains("do you know"));//true

        String Str = new String("Добро пожаловать");
        System.out.println("Хэш-код для Str: " + Str.hashCode());
        System.out.println("Length для Str: " + Str.length());
        System.out.println("Replace для Str: " + Str.replace('о','x'));

        System.out.println("G)---------------------------------------------------------");

        char[][] c1;
        char[][] c2 = {{'a', 'b'}};
        char[][] c3 = {{'1', '3'}};

        char[] nullarr = new char[0];

        c1 = new char[3][];
        c1[0] = new char[1];
        c1[1] = new char[2];
        c1[2] = new char[3];

        c1[0][0] = 'a';
        c1[1][0] = 'b';
        c1[1][1] = 'c';
        c1[2][0] = 'd';
        c1[2][1] = 'e';
        c1[2][2] = 'f';

        System.out.println("Length для Str1: " +c1[0].length);
        System.out.println("Length для Str2: " +c1[1].length);
        System.out.println("Length для Str3: " +c1[2].length);

        //boolean comRez = с2==с3;
        //с2 = с3;

        for (char[] xz : c1) {
            System.out.println(xz);
        }

        //System.out.println("Length для Str3: " +c1[5].length); // выход за пределы массива

        System.out.println("H)---------------------------------------------------------");

        WrapperString sw = new WrapperString("A,B,C");
        sw.replace(',',';');
        System.out.println(sw.getStr());
        sw.delete('A');
        System.out.println(sw.getStr());


        WrapperString Anon = new WrapperString("default"){
            @Override
            public void replace(char oldchar, char newchar) {
                super.replace(oldchar, newchar);
                System.out.println("ABBBA");
            }

        };


    }
}
