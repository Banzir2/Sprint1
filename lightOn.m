function lightOn()
ledPin='D8';
port='COM3';
board='Leonardo';

a = arduino(port, board);

a.writeDigitalPin(ledPin, 1);
pause(10);
end
