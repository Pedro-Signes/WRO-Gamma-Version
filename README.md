# WRO-Gamma-Version
Diseño coche autónomo para la competición Future Engineers 2022
* Equipo: GammaVersion 
* Nombre del Coche: Mototruco
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

Versión en Inglés/English Version

Autonomous car design for the Future Engineers competition 2022

* Team: GammaVersion 
* Name of the car: Mototruco
* Members:
  * Javier Calero
  * Pablo Huertas
  * Pedro Signes

Our team comes from the city of Denia (Alicante), and the team is made up of three members plus a coach from the Diverbot academy, which is also the headquarters where we do all the tests with the robot.

When talking about the robot, we have to highlight the two microcontrollers that we have, which communicate through an I2C port in a master system (ESP32) slave (Arduino Nano). However, our robot also contains an intelligent Pixy 2.0 camera, which greatly facilitates the work when detecting obstacles.

Returning to the microcontrollers, the ESP32 when communicating with the Arduino Nano can do two things, ask or order it, since the Arduino Nano is the slave of this system when it receives one of these two it will do the following, it will answer the question or will do the ordinance.

Getting into more detail, the ESP32 contains in its code a state machine, which depending on what information it receives from the Arduino Nano. However, the ESP 32 not only receives information from the Arduino Nano, but also from the camera, which, being intelligent, can be programmed to send us a message when it sees a block, and what color it is.

Moving on to the Arduino Nano, it is connected to the whole motor, servo, ultrasonics, accelerometer, and encoder. While it is waiting for messages from ESP32 the Arduino uno keeps the car in the last indicated direction and speed thanks to a programmed DP.

Then it is worth highlighting the Pixy 2.0, which already has a program to detect objects and their colors. However, the camera has to indicate some parameters in the form of assignments, which the ESP32 will then receive and with them it can make decisions.

Finally, it is worth mentioning the four ultrasounds that the robot poses, since these indicate the distance that it has in front, to the sides, and behind. This data will reach the ESP32 through the system explained previously, and with it the ESP32 will make different decisions.

  
![FotoEquipo](https://user-images.githubusercontent.com/100376253/175772085-2c6c82bf-9e69-456e-927b-e3cf1254dc0f.jpeg)
