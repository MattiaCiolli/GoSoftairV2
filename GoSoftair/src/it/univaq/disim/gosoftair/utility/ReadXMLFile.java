package it.univaq.disim.gosoftair.utility;

import oracle.jdbc.OracleTypeMetaData;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.*;

/**
 * Created by Davide on 10/02/2017.
 */
public class ReadXMLFile {

    private Map<String, Collection<String>> meteo = new HashMap<String, Collection<String>>();

    // String dataEvento="20170210";
    // String oraEvento="14:00";
    public Map<String, Collection<String>> leggiDatiMeteo(String dataEvento, String oraEvento, String urlMeteo){

        try {

            URL facultyURL = new URL(urlMeteo);
            InputStream is = facultyURL.openStream();

            //File fXmlFile = new File("C:/Users/Davide/Desktop/meteoAQ.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(is);
            doc.getDocumentElement().normalize();

            Boolean giornoTrovato = false;
            Boolean oreTrovate = false;
            int contaFinoTreOre = 3;
            int contatoreOre = 1;

            String ora;
            String temperatura;
            String simbolo;
            String ventoVelocita;
            String ventoDirezione;


            NodeList nListGiorni = doc.getElementsByTagName("day");
            for (int temp = 0; temp < nListGiorni.getLength() && !giornoTrovato; temp++) {
                Node nNodeGiorno = nListGiorni.item(temp);

                String data = nNodeGiorno.getAttributes().getNamedItem("value").getNodeValue();
                if (nNodeGiorno.getNodeType() == Node.ELEMENT_NODE && data.contentEquals(dataEvento)) {

                    giornoTrovato = true;
                    //System.out.println("Data:" + data);

                    NodeList nListOre = doc.getElementsByTagName("hour");
                    for (int i = 0; i < nListOre.getLength() && !oreTrovate; i++) {
                        Node nNodeOra = nListOre.item(i);

                        ora = nNodeOra.getAttributes().getNamedItem("value").getNodeValue();
                        if (nNodeOra.getNodeType() == Node.ELEMENT_NODE && (ora.contentEquals(oraEvento) || (contaFinoTreOre<3 && contaFinoTreOre>0))){
                            contaFinoTreOre--;

                            //System.out.println("Ora: "+ora);
                            Element valoriPerUnOra = (Element)nNodeOra;

                            temperatura = valoriPerUnOra.getElementsByTagName("temp").item(0).getAttributes().getNamedItem("value").getNodeValue();
                            simbolo = valoriPerUnOra.getElementsByTagName("symbol").item(0).getAttributes().getNamedItem("value2").getNodeValue();
                            ventoVelocita = valoriPerUnOra.getElementsByTagName("wind").item(0).getAttributes().getNamedItem("value").getNodeValue();
                            ventoDirezione = valoriPerUnOra.getElementsByTagName("wind").item(0).getAttributes().getNamedItem("dir").getNodeValue();

                            Collection<String> meteoOrario= new ArrayList<>();
                            meteoOrario.add(ora);
                            meteoOrario.add(temperatura);
                            meteoOrario.add(simbolo);
                            meteoOrario.add(ventoVelocita);
                            meteoOrario.add(ventoDirezione);
                            this.meteo.put("ora"+contatoreOre, meteoOrario);
                            contatoreOre++;
                        }
                        if(contaFinoTreOre == 0){
                            oreTrovate = true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //esempio di prelevamento da map completa
        //System.out.println(meteo.get("ora1"));
        //System.out.println(meteo.get("ora2"));
        //System.out.println(meteo.get("ora3"));

        return this.meteo;

    }

}
