
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



    }
}
