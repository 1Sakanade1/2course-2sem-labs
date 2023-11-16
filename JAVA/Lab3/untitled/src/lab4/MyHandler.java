package lab4;

import by.belstu.it.markovich.ITCompany.Person;
import by.belstu.it.markovich.ITCompany.gender;
import by.belstu.it.markovich.ITCompany.position;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class MyHandler extends DefaultHandler {
    private Person person = new Person();
    private String currentElement;

    public Person getMyClass() {
        return person;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        currentElement = qName;
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        currentElement = "";
    }

    @Override
    public void characters(char ch[], int start, int length) throws SAXException {
        if (currentElement.equalsIgnoreCase("name")) {
            person.setname(new String(ch, start, length));
        } else if (currentElement.equalsIgnoreCase("age")) {
            person.setage(Integer.parseInt(new String(ch, start, length)));
        }

    }
}