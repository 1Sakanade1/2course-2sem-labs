import by.belstu.it.markovich.ITCompany.Company;
import by.belstu.it.markovich.ITCompany.Person;
import by.belstu.it.markovich.ITCompany.gender;
import by.belstu.it.markovich.ITCompany.position;
import lab4.MyHandler;
import org.xml.sax.SAXException;


import javax.xml.XMLConstants;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;

public class Main {
    private static final Logger LOG = Logger.getLogger(String.valueOf(Main.class));


    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {

        LOG.log(Level.INFO, "start");

        Person person1 = new Person("Anton", 23, gender.male, position.junior, 1200);
        Person person2 = new Person("Vlad", 32, gender.male, position.engineer, 3000);
        Person person3 = new Person("Vika", 28, gender.female, position.middle, 2300);
        Person person4 = new Person("Maksim", 36, gender.male, position.director, 5000);
        Person person5 = new Person("Aleksei", 22, gender.male, position.junior, 1300);

        List<Person> staff = new ArrayList<>();

        Company company1 = new Company(staff);
        company1.AddEmployee(person1);
        company1.AddEmployee(person2);
        company1.AddEmployee(person3);
        company1.AddEmployee(person4);
        company1.AddEmployee(person5);

        company1.GetStaffList();


        List<position> PlanSet = new ArrayList<position>();
        PlanSet.add(position.engineer);
        PlanSet.add(position.middle);
        // PlanSet.add(position.systemAdministrator);

        System.out.println(company1.CheckPlanSet(PlanSet));

        System.out.println("количество сотрудников = " + company1.GetStaffAmount());

        company1.SortBySalary(1400, 5000);

        company1.SearchByPos(position.junior);

        //--Парсинг XML
        try {
            System.out.println("--------------Парсинг XML------------------");
            SAXParserFactory parseFactory = SAXParserFactory.newInstance();
            SAXParser saxParser = parseFactory.newSAXParser();

            MyHandler handler = new MyHandler();
            saxParser.parse(new File("files/ Data.xml"), handler);

            Person person = handler.getMyClass();
            System.out.println("Name: " + person.getname() + ", Age: " + person.getage());


            //--Валидация XML
            System.out.println("--------------Валидация XML------------------");
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);

            File schemaFile = new File("files/schema.xsd");
            Schema schema = factory.newSchema(schemaFile);

            Validator validator = schema.newValidator();

            File xmlFile = new File("files/data.xml");
            try {
                validator.validate(new StreamSource(xmlFile));
                System.out.println(xmlFile.getAbsolutePath() + " is valid");
            } catch (SAXException e) {
                System.out.println(xmlFile.getAbsolutePath() + " is NOT valid reason:" + e);
            }

            System.out.println("--------------Сериализация XML------------------");
            FileOutputStream out = new FileOutputStream("files/Serialization.xml");
            XMLEncoder xmlEncoder = new XMLEncoder(out);
            xmlEncoder.writeObject(person5);
            xmlEncoder.close();

            //--Десиреализация XML
            System.out.println("--------------Десериализация XML------------------");
            FileInputStream in = new FileInputStream("files/Serialization.xml");
            XMLDecoder xmlDecoder = new XMLDecoder(in);
            Person DeserPers = (Person) xmlDecoder.readObject();
            xmlDecoder.close();
            System.out.println(DeserPers.name);
            System.out.println(DeserPers.age);
            System.out.println(DeserPers.salary);

            System.out.println("-----------------Сериализация JSON---------------");
            Gson gson = new GsonBuilder().create();
            String json = gson.toJson(person1);
            System.out.println(json);
            FileOutputStream jsonOut = new FileOutputStream("files/Serialize.json");
            byte[] outText = json.getBytes(StandardCharsets.UTF_8);
            jsonOut.write(outText, 0, outText.length);
            //--Десериализация Json
            System.out.println("--------------Десериализация JSON---------------");
            Scanner scanner = new Scanner(new File("files/Serialize.json"));
            String res = "";
            while (scanner.hasNext())
                res += scanner.nextLine();
            scanner.close();
            Person jsonpers = gson.fromJson(res, Person.class);
            System.out.println(jsonpers.name);
            System.out.println(jsonpers.age);
            System.out.println(jsonpers.salary);
            //--Stream API
            System.out.println("-------------------Stream API-------------");
            Stream<Person> res_stream = staff.stream().filter(w -> w.GetSalary() > 1000);
            for (var x : res_stream.toList()) {
                System.out.println(x.name + " " + x.salary);
            }
            System.out.println("----------------------------------");
            Stream<Person> res_stream2 = staff.stream().limit(2);
            for (var x : res_stream2.toList()) {
                System.out.println(x.name + " " + x.salary);
            }

        } catch (Exception e) {
            LOG.info(e.getMessage());
        }
        LOG.log(Level.INFO, "end");


    }
}
