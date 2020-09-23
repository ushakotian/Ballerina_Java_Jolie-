/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package amqpprocessor;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 *
 * @author IT-LT46
 */
public class AMQPProcessor {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        //int counter = 0;
        int counter1 = 0;
        int counter2 = 0;
        int counter3 = 0;
        int counter4 = 0;
        
        
        
        //String path = "C:\\whitireia\\research\\Ballerina_Java_Jolie\\workspace\\Execution\\AMQPProcessor\\Ballerina_AMQP_JSON.txt";
        String path = args[0];
        InputStream is = new FileInputStream(path);
        BufferedReader buf = new BufferedReader(new InputStreamReader(is));
        String line = buf.readLine();
        StringBuilder sb = new StringBuilder();
        
        long[] reqStart = new long[10];
        long[] msgSent = new long[10];
        long reqfin = 0;
        long msgrec = 0;
        long totalproc = 0;
        long msgProc = 0;
        int sum = 0;
        while (line != null) {
            if (line.contains("Request Received Time")) { 
                String time = line.substring((line.indexOf("=") + 2), line.length()).trim();
                if(time.contains("#")){
                time = time.substring(0,time.indexOf("|"));
                }
                reqStart[counter1] = Long.parseLong(time);
                counter1++;

            } else if (line.contains("Message sent Time")) {
               String time = line.substring((line.indexOf("=") + 2), line.length()).trim();
                if(time.contains("#")){
                time = time.substring(0,time.indexOf("|"));
                }
                msgSent[counter2] = Long.parseLong(time);
                counter2++;
            } else if (line.contains("Message Received Time")) {     
                String time = line.substring((line.indexOf("=") + 2), line.length()).trim();
                if(time.contains("#")){
                time = time.substring(0,time.indexOf("|"));
                }
                int rq = (counter3 + 1);
                sb.append("Request " + rq).append("\n");
                msgrec  = Long.parseLong(time);
                msgProc  = msgrec - msgSent[counter3];
                counter3++;
                sb.append("Message Transfer Time in ms = " + msgProc).append("\n");
            } else if (line.contains("Message Processed Time")) {
                String time = line.substring((line.indexOf("=") + 2), line.length()).trim();
                if(time.contains("#")){
                time = time.substring(0,time.indexOf("|"));
                }
                reqfin = Long.parseLong(time);
                totalproc = reqfin - reqStart[counter4];
                sum += totalproc;
                sb.append("Total Processing Time in ms= " + totalproc).append("\n");
                counter4++;
            }
            
            line = buf.readLine();
        }
        sb.append("Sum Total = " + sum);
        String fileAsString = sb.toString();
        System.out.println("Contents : " + fileAsString);
        FileWriter myWriter = new FileWriter("Output.txt");
        myWriter.write(fileAsString);
        myWriter.close();
        System.out.println("Successfully wrote to the file.");

    }

}
