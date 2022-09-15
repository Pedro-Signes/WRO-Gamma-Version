# WRO-Gamma-Version
Diseño coche autónomo para la competición Future Engineers 2022
* Equipo: GammaVersion
* Coche: Mototruco
* Integrantes:
  * Javier Calero
  * Pablo Huertas
  * Pedro Signes

Nuestro equipo proviene de la cuidad de Denia (Alicante), y se compone el equipo de tres integrantes mas un coach de la academia Diverbot, la cual también es la cede donde hacemos todas las pruebas con el robot.

A la hora de hablar del robot, tenemos que destacar los dos microcontroladores que tenemos, los cuales se comunican por un puerto I2C en un sistema maestro(ESP32) esclavo(Arduino Nano).No obstante también nuestro robot contiene una cámara inteligente Pixy 2.0, la cual facilita mucho el trabajo a la hora de detectar los obstáculos.

Volviendo a los microcontroladores, el ESP32 a la hora de comunicarse con el Arduino Nano puede hacer dos cosas, preguntarle o ordenarle, ya que el Arduino Nano es el esclavo de este sistema cuando reciba una de estas dos hará lo siguiente, responderá a la pregunta o hará la ordenanza.

Metiéndonos mas en detalle, el ESP32 contiene en su código una maquina de estados, la cual dependiendo de que información reciba del Arduino Nano. No obstante, el ESP 32 no solo recibe información del Arduino Nano, también de la cámara, la cual al ser inteligente se puede programar para que nos mande un mensaje cuando vea un bloque, y de que color es.

Pasando al Arduino Nano, el esta conectado al todo al motor, al servo, a los ultrasonidos, a un acelerómetro, y a un encoder. Mientras esta esperando a los mensajes del ESP32 el Arduino uno mantiene el coche en la ultima dirección y velocidad indicada gracias a un DP programado.

Después cabe destacar la Pixy 2.0, la cual ya tiene un programa para detectar objetos y sus colores. No obstante, la cámara se le tiene que indicar unos parámetros en forma de asignaciones, que luego recibirá el ESP32 y con ellas puede tomar las decisiones. 

Por ultimo cabe destacar los cuatro ultrasonidos que pose el robot, ya que estos le indica la distancia que tiene delante, a los lados, y detrás. Esto datos llegaran al ESP32 mediante el sistema explicado previamente, y con ellos el ESP32 tomara diferentes decisiones.

  
![FotoEquipo](https://user-images.githubusercontent.com/100376253/175772085-2c6c82bf-9e69-456e-927b-e3cf1254dc0f.jpeg)
