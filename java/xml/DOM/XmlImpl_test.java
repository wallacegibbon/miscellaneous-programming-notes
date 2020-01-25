
public class XmlImpl_test {
  public static void main(String[] args) {
    XmlImpl t = new XmlImpl();
    t.init();

    String f = "./test.xml";
    t.createXml(f);
    t.parserXml(f);
  }
}
