#include <OneWire.h>
#include <DallasTemperature.h>
const int buzzer = A1;
const int buzzerperiod=5000;
const int buzzerontime=100;
#define ONE_WIRE_BUS 5

OneWire oneWire(ONE_WIRE_BUS);

DallasTemperature sensors(&oneWire);

 float Celcius=0;
 float Fahrenheit=0;
void setup(void)
{
  pinMode(buzzer, OUTPUT);
  Serial.begin(9600);
  sensors.begin();
}

void loop(void)
{ 
  sensors.requestTemperatures(); 
  Celcius=sensors.getTempCByIndex(0);
  Fahrenheit=sensors.toFahrenheit(Celcius);
  if(Celcius>20)
  {
    digitalWrite(buzzer,HIGH);
    delay(buzzerperiod);
    digitalWrite(buzzer,LOW);
    delay(buzzerontime);
  }
  else 
  {
    digitalWrite(buzzer,LOW);
  }
  
  Serial.print(" C  ");
  Serial.print(Celcius);
  Serial.print(" F  ");
  Serial.println(Fahrenheit);
  delay(1000);
}