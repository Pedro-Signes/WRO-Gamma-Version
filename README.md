# WRO-Gamma-Version
Diseño coche autónomo para la competición Future Engineers 2022
* Equipo: GammaVersion 
* Nombre del Coche: Mototruco
* Integrantes:
  * Javier Calero
  * Pablo Huertas
  * Pedro Signes

Nuestro equipo proviene de la cuidad de Denia (Alicante), y se compone de tres integrantes más un coach de la academia Diverbot, la cual también es la sede donde hacemos todas las pruebas con el robot.

A la hora de hablar del robot, tenemos que destacar los dos microcontroladores que tenemos, los cuales se comunican por un puerto I2C en un sistema maestro (ESP32) esclavo (Arduino Nano).No obstante nuestro robot contiene adicionalmente una cámara inteligente Pixy 2.0, la cual facilita mucho el trabajo a la hora de detectar los obstáculos y se comunica con el ESP32 mediante un puerto SPI.

Volviendo a los microcontroladores, el ESP32 a la hora de comunicarse con el Arduino Nano puede hacer dos cosas, preguntarle o ordenarle, puesto que el Arduino Nano es el esclavo de este sistema cuando reciba una de estas dos hará lo siguiente, responderá a la pregunta o hará la orden.

Metiéndonos más en detalle, el ESP32 contiene en su código una maquina de estados, la cual dependiendo de qué información reciba del Arduino Nano. No obstante, el ESP 32 no solo recibe información del Arduino Nano, también de la cámara, la cual al ser inteligente se puede programar para que nos mande un mensaje cuando vea un bloque, y de que color es.

Pasando al Arduino Nano, este está conectado al todo al motor, al servo, a los ultrasonidos, a un giroscopio, y a un encoder. Mientras esta esperando a los mensajes del ESP32 el Arduino Nano mantiene la brujula del coche funcionando y regula la velocidad a la indicada gracias a un DP programado.

Después cabe destacar la Pixy 2.0, la cual ya tiene un programa para detectar objetos y sus colores. No obstante, la cámara se le tiene que indicar unos parámetros en forma de asignaciones, que luego recibirá el ESP32 y con ellas puede tomar las decisiones. 

Por ultimo cabe destacar los cuatro ultrasonidos que posee el robot, ya que estos le indica la distancia que tiene delante, a los lados, y detrás. Esto datos llegaran al ESP32 mediante el sistema explicado previamente, y con ellos el ESP32 tomara diferentes decisiones.

Versión en Inglés/English Version

Autonomous car design for the Future Engineers competition 2022

* Team: GammaVersion 
* Name of the car: Mototruco
* Members:
  * Javier Calero
  * Pablo Huertas
  * Pedro Signes

Our team comes from the city of Denia (Valencian region, Spain), and the team is made up of three members (Pablo, Pedro & Javi) plus a coach from the Diverbot academy, which is also the headquarters where we do all the developement of the project. We met on February of this year and we have been working hard since then to succeed in accomplish the chellenge of the Future Engineers Category of the World Robot Olympiad 2022.

The base of our robot is the chassis of a radio control car that we have broke down. Therefore, we alredy have a structure, an engine and a servo-direction. To achieve the car being autonomous we have to add a microcontroller, for this job we decided at the begining to use a Arduino Uno. This has been changed in june to an ESP32 and an Arduino Nano because only one microcontroller was not enough to opperate all the program with the adequate accuracy. This paradigma has been used in the Madrid competition and in the national final, but two weeks ago we ran away of interrupt pins, so we added an Arduino Nano Every since all its pins have interruptions. To support these three microcontrollers we have designed a wooden plank, where later we would place all the electronics. To join the plank with the chassis we have designed a couple of 3D supports, a frontal wall and two lateral pillars.

Our car is divided in four parts: the structure, explained before; the microcontrollers, which run the program; the sensors and the engine and servos.
The main part of our robot is the three controllers each one with a different program running. These programs are not parallel or isolated, they communicate trough an I2C bus. This protocol consists on a master, who can ruequest or send data to a slave who obeys the orders of the master. In our case, the ESP32 is the master, and the Arduino Nano and the Arduino Nano Every are the slaves.

By using this protocol we enable the ESP32 to run the main program at a good pace. The ESP32 has a little state machine, which time ago was huge but we have been able to simplify it by the algorithm we have developed, which is going to be explained now. The function of the main program is to detect the color blocks and pass them by the correct side. The way we have done it is by calculating the position of the car, x and y coordinates (width and length, respectively), at every time and telling the car to go to certain X position, which will be right or left. The knowledge of the position can be achieved by integrating the distance and the angle of the car at every time with a certain trigonometric function. An encoder is used to know the position and an MPU 9250 to work out the angle. The encoder has been designed with the 3D printer with 8 holes to let the light pass trough and it has been connected to the Arduino Nano. The MPU has a gyroscope mode, which lets you know the angular speed of the car, and integrating the angular speed over time you calculate the angle at which the car is respect to the origin. Let us point that the MPU is also connected to the ESP32 by a I2C bus, but in a different port to the employed with the arduinos because it caused problems.

In reference to the algorithm to manage the car going to a specific coordinate, it is based in a PID controller, however only the P and D terms. The desired setpoint is the objective position, the variable to control is the position and the actuator is the direction servo. The error between the desired setpoint and the actual value of the variable is worked out and the proportional and derivative are aplied. The result of the calculations is the angle at which the car has to point to arrive to the desired position.

To keep the algorithm symetric in every section we reset the coordinate system, hence, to avoid a red block the car will always have to move 20 cm from the origin, the center of the section. This change of coordinates can be done by a simple mathematical opertaion or taking into account the distance to the walls.

Restarting the coordinate system and employing the PD controller of the position the turns are consequently genereated, because when the coordiante system changes the car will still try to be at the desired X coordinate and in order to magange this it will move the servo and turn. The only thing we have to do is to set at which position it has to start to turn.

Moving on to the Arduino Nano, it is connected to the whole motor, servo, ultrasonics, and encoder. While it is waiting for messages from ESP32 the Arduino uno keeps the car in the last indicated speed thanks to a programmed DP.

Then it is worth highlighting the Pixy 2.0, an intelligent Pixy 2.0 camera, which greatly facilitates the work when detecting obstacles. Pixy already has a software to detect objects and their colors. To return the data, the camera has to be configured in the form of assignments, which the ESP32 will then receive and with them it can make decisions.

Finally, it is worth mentioning the four ultrasounds that the robot poses, since these indicate the distance that it has in front, to the sides, and behind. This sensors are connected to the Arduino Nano but the data will reach the ESP32 through the system explained previously, and with it the ESP32 will make different decisions. Recently we have noticed that the ultrasonic sensors would not obtain enough accurate measures of the distance and this affects our program beacause we cannot have an accurate check of the position of the car. Therefore we decided to add new sensors, the TOF sensors or unofficialy laser sensors. These ones are connected to the Arduino Nano Every because as explained before, all the pins in this microcontroller have interruptions which allow us to measure better with this sensors.

This is all our car which we have developed with hard work and effort, but learning a lot.

  
![FotoEquipo](https://user-images.githubusercontent.com/100376253/175772085-2c6c82bf-9e69-456e-927b-e3cf1254dc0f.jpeg)
