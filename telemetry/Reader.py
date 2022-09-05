# read UPD message from the ESP32
# this code should be run on a laptop/rasp pi that is connected to the wifi network created by the ESP32
# note that since you are connecting your laptop to the ESP32's wifi network, you will not be able to access the internet
# you will only be able to communicate with the ESP32
# for a version of this communication code that allows your laptop to still connect to the internet, see https://gist.github.com/santolucito/4016405f54850f7a216e9e453fe81803

import socket
# use ifconfig -a to find this IP. If your pi is the first and only device connected to the ESP32, 
# this should be the correct IP by default on the raspberry pi
LOCAL_UDP_IP = "192.168.1.2"
SHARED_UDP_PORT = 4210
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # Internet  # UDP
sock.bind((LOCAL_UDP_IP, SHARED_UDP_PORT))
def loop():
    while True:
        data, addr = sock.recvfrom(2048)
        print(data)
if __name__ == "__main__":
    loop()
