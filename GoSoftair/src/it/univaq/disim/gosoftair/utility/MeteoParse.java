package it.univaq.disim.gosoftair.utility;

import com.sun.deploy.net.URLEncoder;
import oracle.jdbc.OracleTypeMetaData;
import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.soap.SAAJResult;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Davide on 10/02/2017.
 * La classe MeteoParse si occupa di richiamare il servizio meteo dal sito ilmeteo.net
 * e di elaborare la risposta inserendola in opportune strutture dati
 */
public class MeteoParse {


    /**
     * Il metodo leggiDatiMeteo si occupa di ricavare le informazioni meteo relative alle tre ore successive
     * alla data e l'ora indica nel parametro dataEventoCompleta (di tipo Date), elaborando l'XML puntato dal parametro
     * urlMeteo (di tipo String).
     * Il servizio rende disponibili le previsioni al massimo quattro giorni prima.
     *
    **/
    public  Map<String, Collection<String>> leggiDatiMeteo(Date dataEventoCompleta, String urlMeteo){

        String dataEvento = new SimpleDateFormat("yyyyMMdd").format(dataEventoCompleta);
        String oraEvento = new SimpleDateFormat("kk").format(dataEventoCompleta)+":00";

         Map<String, Collection<String>> meteo = new HashMap<String, Collection<String>>();

        try {

            URL facultyURL = new URL(urlMeteo);
            InputStream is = facultyURL.openStream();

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
                            meteoOrario.add(this.recuperaSimbolo(simbolo));
                            meteoOrario.add(descrizione);
                            meteoOrario.add(ventoVelocita);
                            meteoOrario.add(this.recuperaSimbolo(ventoDirezione));
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

        return meteo;

    }


    /**
     * La funzione calcolaUrlMeteo si occupa di ricavare l'url che punta all'XML relativo al comune indicato nel parametro
     * comune ( di tipo String) che si trova nella provincia indicata nel parametro provincia (di tipo String).
     * Questa funzione è necessaria poiche l'API meteo utilizzata in genere fornisce il servizio solo per uno specifico
     * comune a cui è assegnato un codice, mentre per l'applicazione Gosoftair servono previsioni meteo per il luogo dove si
     * svolgerà la partita che potenzialmente, può avvenire in ogni comune d'Italia.
     * Attraverso il parse di due documenti XML, il primo per identificare il codice della provincia, il secondo per
     * identificare il codice del comune, si calcola l'url effettivo ritornato, del file XML con i dati meteo desiderati.
     * Dato che i due documenti XML analizzati hanno la stessa identica struttura, si utilizza solo la funzione trovacodice
     * che li analizza entrambi.
     *
    **/
    public String calcolaUrlMeteo(String provincia, String comune){
        String codiceProvincia= "";
        String codiceCumune = "";

        String urlTutteProvincieIta = "http://api.ilmeteo.net/index.php?api_lang=it&pais=20&affiliate_id=xh29u2qrnhr8";
        codiceProvincia = this.trovacodice(urlTutteProvincieIta, provincia);

        String urlTuttiComuniProv = "http://api.ilmeteo.net/index.php?api_lang=it&provincia="+codiceProvincia+"&affiliate_id=xh29u2qrnhr8";
        codiceCumune = this.trovacodice(urlTuttiComuniProv, comune);

        String urlFinaleComune = "http://api.ilmeteo.net/index.php?api_lang=it&localidad="+codiceCumune+"&affiliate_id=xh29u2qrnhr88&v=2.0&h=1";

        return urlFinaleComune;

    }


    /**
     * Effettua l'analisi del file XML puntato dalla url nel parametro urlDoveCercare ( di tipo String )
     * cercando il all'interno di esso il contenuto del parametro cosaCercare ( di tipo String ).
     * Il codice trovato viene quindi ritonato.
     *
     **/
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


    /**
     * La funzione recuperaSimbolo si occupa di ricavere dal codice fornito dal servio meteo, la classe css
     * per i simboli meteo e simboli del vento utilizzati per il progetto.
     * Utilizzando una funzione esterna si rende in codice più flessibile a scelte future che implicano
     * il cambiamenti di questi simboli.
     *
     */
    public String recuperaSimbolo(String simbolo){

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


    /**
     * Il metodo geocoding elaborando le coordinate geografiche passategli in lat e lng ( di tipo String)
     * ritorna la provincia e il comune presente a quelle cordinate.
     * Questo viene fatto richiamando un servizio di google maps che restituisce un JSON con molti dettagli
     * relative a quelle cordinate. Una volta ottenuta la provincia da questa struttura dati viene controllata e nel
     * caso riadattata a un formato consono per essere utilizzata dal servizio meteo.
     *
     */
    public ArrayList<String> geocoding(String lat, String lng) {


        ArrayList<String> risultati= new ArrayList<>();
        // build a URL
        String s = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&key=AIzaSyAq8UAokX0-7blk-4iL6RVXrgzPlcS606I";
        try {
            URL url = new URL(s);
            // read from the URL
            Scanner scan = new Scanner(url.openStream());
            String str = new String();
            while (scan.hasNext())
                str += scan.nextLine();
            scan.close();
            // build a JSON object
            JSONObject obj = new JSONObject(str);
            if (obj.getString("status").equals("OK")) {
                // get the first result
                JSONObject res = obj.getJSONArray("results").getJSONObject(0);
                JSONArray address = res.getJSONArray("address_components");
                String comune = "";
                String provincia = "";
                for (int i = 0; i < address.length(); i++) {
                    JSONObject oggetto = res.getJSONArray("address_components").getJSONObject(i);

                    if (oggetto.getJSONArray("types").get(0).toString().contentEquals("administrative_area_level_3")) {
                        comune = oggetto.get("long_name").toString();
                    }
                    if (oggetto.getJSONArray("types").get(0).toString().contentEquals("administrative_area_level_2")) {
                        provincia = oggetto.get("long_name").toString();
                    }
                }


                ArrayList<String> provincieAtipiche = new ArrayList<>();
                provincieAtipiche.add("Provincia di Ascoli Piceno");
                provincieAtipiche.add("Provincia della spezia");
                provincieAtipiche.add("Provincia dell'Aquila");
                provincieAtipiche.add("Provincia di Massa e Carrara");
                provincieAtipiche.add("Provincia di Monza e della Brianza");
                provincieAtipiche.add("Provincia di Pesaro e Urbino");
                provincieAtipiche.add("Provincia di Reggio Calabria");
                provincieAtipiche.add("Provincia di Reggio Emilia");

                ArrayList<String> provicieAtipicheGiuste = new ArrayList<>();
                provicieAtipicheGiuste.add("Ascoli Piceno");
                provicieAtipicheGiuste.add("La spezia");
                provicieAtipicheGiuste.add("L'Aquila");
                provicieAtipicheGiuste.add("Massa e Carrara");
                provicieAtipicheGiuste.add("Monza e Brianza");
                provicieAtipicheGiuste.add("Pesaro e Urbino");
                provicieAtipicheGiuste.add("Reggio di Calabria");
                provicieAtipicheGiuste.add("Reggio nell'Emilia");

                Map<String, String> provincieStrane = new HashMap<>();
                for(int i=0; i<8; i++ ){
                    provincieStrane.put(provincieAtipiche.get(i),provicieAtipicheGiuste.get(i));
                }

                if(provincieAtipiche.contains(provincia)){
                    provincia = provincieStrane.get(provincia);
                }else{
                    String [] splits = provincia.split("[\\s']");
                    provincia = splits[2];

                }



                risultati.add(provincia);
                risultati.add(comune);
            }

        }catch (Exception e){
            e.printStackTrace();
        }


        return risultati;
    }


}
