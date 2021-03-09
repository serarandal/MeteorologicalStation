//NOTA
// Se obtienen dos warnings, pero compila sin errores.

#include <WiFi.h>
#include <WiFiClient.h>
#include <WiFiServer.h>
#include <WiFiUdp.h>
#include <WiFi.h>
#include <SoftwareSerial.h>


const char* ssid     = "Wifi12345";
const char* password = "12345";

// Set web server port number to 80
WiFiServer server(80);

// Variable to store the HTTP request
String header;
SoftwareSerial datosarduino (2, 3);
float leedatos;

//Test
//leedatos = 00000000;

void setup() {
  Serial.begin(115200);


  // Connect to Wi-Fi network with SSID and password
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Print local IP address and start web server
  Serial.println("");
  Serial.println("WiFi conectado.");
  Serial.println("IP: ");
  Serial.println(WiFi.localIP());
  server.begin();
}

void loop() {
  WiFiClient client = server.available();   // Listen for incoming clients

  if (client) {                             // If a new client connects,
    Serial.println("Cliente nuevo.");          // print a message out in the serial port
    String currentLine = "";                // make a String to hold incoming data from the client
    while (client.connected()) {            // loop while the client's connected
      if (client.available()) {             // if there's bytes to read from the client,
        char c = client.read();             // read a byte, then
        Serial.write(c);                    // print it out the serial monitor
        header += c;
        if (c == '\n') {                    // if the byte is a newline character
          // if the current line is blank, you got two newline characters in a row.
          // that's the end of the client HTTP request, so send a response:
          if (currentLine.length() == 0) {
            // HTTP headers always start with a response code
            // and a content-type so the client knows what's coming, then a blank line:
            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html");
            client.println("Connection: close");
            client.println();

            // Web Page Heading
            client.println("<body><h1>ESP32 Web Server</h1>");

            // Display the HTML web page
            client.println("<!DOCTYPE html><html>");
            client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            client.println("<link rel=\"icon\" href=\"data:,\">");
            client.println("<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}");
            client.println("text-decoration: none; font-size: 30px; margin: 2px; cursor: pointer;}");

            //Read data from the ports selected
            char x = Serial.read();
            leedatos += x;
            if (leedatos <= 0 || leedatos <= 40) {
              client.println("<p>Datos leidos de temperatura </p>");
              client.println(leedatos);
            }
            else if (leedatos <= 100 || leedatos >= 40) {
              client.println("<p>Datos leidos de humedad </p>");
              client.println(leedatos);
            }
            else if (leedatos >= 100) {
              client.println("<p>Datos leidos de presion </p>");
              client.println(leedatos);
            }


            client.println("</body></html>");
            // The HTTP response ends with another blank line
            client.println();
            // Break out of the while loop
            break;
          } else { // if you got a newline, then clear currentLine
            currentLine = "";
          }
        } else if (c != '\r') {  // if you got anything else but a carriage return character,
          currentLine += c;      // add it to the end of the currentLine
        }
      }
    }
    // Clear the header variable
    header = "";
    // Close the connection
    client.stop();
    Serial.println("Client disconnected.");
    Serial.println("");
  }
}
