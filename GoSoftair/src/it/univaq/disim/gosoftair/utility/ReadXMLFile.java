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


    // String dataEvento="20170210";
    // String oraEvento="14:00";
    public static Map<String, Collection<String>> leggiDatiMeteo(String dataEvento, String oraEvento, String urlMeteo){

         Map<String, Collection<String>> meteo = new HashMap<String, Collection<String>>();

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
            String descrizione;
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
                            descrizione = valoriPerUnOra.getElementsByTagName("symbol").item(0).getAttributes().getNamedItem("desc2").getNodeValue();
                            ventoVelocita = valoriPerUnOra.getElementsByTagName("wind").item(0).getAttributes().getNamedItem("value").getNodeValue();
                            ventoDirezione = valoriPerUnOra.getElementsByTagName("wind").item(0).getAttributes().getNamedItem("dir").getNodeValue();


                            Collection<String> meteoOrario= new ArrayList<>();
                            meteoOrario.add(ora);
                            meteoOrario.add(temperatura);
                            meteoOrario.add(simbolo);
                            meteoOrario.add(descrizione);
                            meteoOrario.add(ventoVelocita);
                            meteoOrario.add(ventoDirezione);
                            meteo.put("ora"+contatoreOre, meteoOrario);
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

        return meteo;

    }

    public String calcolaUrlMeteo(String provincia, String comune){
        String codiceProvincia= ""; //6010 per la provincia L'Aquila
        String codiceCumune = "";  //30072 per il comune di L'Aquila

        String urlTutteProvincieIta = "http://api.ilmeteo.net/index.php?api_lang=it&pais=20&affiliate_id=xh29u2qrnhr8";
        codiceProvincia = this.trovacodice(urlTutteProvincieIta, provincia);

        String urlTuttiComuniProv = "http://api.ilmeteo.net/index.php?api_lang=it&provincia="+codiceProvincia+"&affiliate_id=xh29u2qrnhr8";
        codiceCumune = this.trovacodice(urlTuttiComuniProv, comune);

        String urlFinaleComune = "http://api.ilmeteo.net/index.php?api_lang=it&localidad="+codiceCumune+"&affiliate_id=xh29u2qrnhr88&v=2.0&h=1";

        //System.out.println("Codice provincia: "+codiceProvincia);
        //System.out.println("Codice comune: "+codiceCumune);
        //System.out.println("Url da usare: "+urlFinaleComune);

        return urlFinaleComune;

    }

    private String trovacodice(String urlDoveCercare, String cosaDaCercare){
        String codiceTrovato = "";

        try {

            URL facultyURL = new URL(urlDoveCercare);
            InputStream is = facultyURL.openStream();

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(is);
            doc.getDocumentElement().normalize();

            NodeList nListDATA = doc.getElementsByTagName("data");
            for (int temp = 0; temp < nListDATA.getLength(); temp++) {
                Node nNodeDATA = nListDATA.item(temp);

                if (nNodeDATA.getNodeType() == Node.ELEMENT_NODE ) {

                    Element elementoData = (Element)nNodeDATA;

                    if(elementoData.getElementsByTagName("name").item(0).getTextContent().contentEquals(cosaDaCercare)){
                        codiceTrovato = elementoData.getElementsByTagName("name").item(0).getAttributes().getNamedItem("id").getNodeValue();
                    }

                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  codiceTrovato;
    }

    public static String recuperaSimbolo(String simbolo){

        Map<String, String> simboli = new HashMap<>();
        String classeSimbolo = "";
        simboli.put("1","wi-day-sunny");
        simboli.put("2","wi-day-sunny-overcast");
        simboli.put("3","wi-day-cloudy");
        simboli.put("4","wi-cloudy");
        simboli.put("5","wi-day-showers");
        simboli.put("6","wi-day-showers");
        simboli.put("7","wi-showers");
        simboli.put("8","wi-day-rain");
        simboli.put("9","wi-day-rain");
        simboli.put("10","wi-rain");
        simboli.put("11","wi-day-storm-showers");
        simboli.put("12","wi-day-thunderstorm");
        simboli.put("13","wi-thunderstorm");
        simboli.put("14","wi-day-hail");
        simboli.put("15","wi-day-hail");
        simboli.put("16","wi-hail");
        simboli.put("17","wi-day-snow");
        simboli.put("18","wi-day-snow");
        simboli.put("19","wi-snow");
        simboli.put("20","wi-day-sleet");
        simboli.put("21","wi-day-sleet");
        simboli.put("22","wi-sleet");
        simboli.put("N","wi-towards-n");
        simboli.put("NE","wi-towards-ne");
        simboli.put("E","wi-towards-e");
        simboli.put("SE","wi-towards-se");
        simboli.put("S","wi-towards-s");
        simboli.put("SW","wi-towards-sw");
        simboli.put("W","wi-towards-w");
        simboli.put("NW","wi-towards-nw");


        classeSimbolo = simboli.get(simbolo);
        return classeSimbolo;
    }

}
