# Variables:
CC = gcc
TARGET = SerialKDPProxy
OBJECTS = src/SerialKDPProxy.o src/kdp_serial.o

CFLAGS = -Wall

all: $(TARGET)


# Programs to build:
$(TARGET): $(OBJECTS)
	$(CC) -g -D_BSD_SOURCE -o $(TARGET) $(OBJECTS)

# Objects to build:
src/SerialKDPProxy.o: src/SerialKDPProxy.c
	$(CC) -c -g -D_BSD_SOURCE  $< -o $@

src/kdp_serial.o: src/kdp_serial.c
	$(CC) -c -g -D_BSD_SOURCE $< -o $@

clean:
	rm -f $(PROGRAM) $(OBJECTS)
install : $(TARGET)
	cp $(TARGET) /usr/local/bin
