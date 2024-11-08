/* 
D: Dependency Inversion
DI is the strategy of depending upon on interfaces or abstract functions or classes rather than on concrete function & classes.
*/

abstract interface class Bulb {
  void turnOn();
  void turnOff();
}

class FirstBulb implements Bulb {
  @override
  void turnOn() {
    print("turning on first bulb");
  }

  @override
  void turnOff() {
    print("turning off first bulb");
  }
}

// Now the room can have any bulb that we want.
class Room {
  Bulb bulb;
  Room(this.bulb);
  /* Room(Bulb bulb) */

  void switchOn() {
    bulb.turnOn();
  }

  void switchOff() {
    bulb.turnOff();
  }
}

void main(List<String> args) {
  // We can't make the instance of abstract class.
  Bulb firstBulb = new FirstBulb();
  Room room = new Room(firstBulb);
  room.switchOn();
  room.switchOff();
}

// Violation of DI Principle
/* 
class FirstBulb {
  void turnOn() {
    print("turning on first bulb");
  }

  void turnOff() {
    print("turning off first bulb");
  }
}

// Room is now tightly coupled to FirstBulb
class Room {
  // Instead of depending on the Bulb interface, it directly depends on FirstBulb
  FirstBulb bulb;
  
  Room(this.bulb);

  void switchOn() {
    bulb.turnOn();
  }

  void switchOff() {
    bulb.turnOff();
  }
}

void main(List<String> args) {
  FirstBulb firstBulb = FirstBulb();
  Room room = Room(firstBulb);
  room.switchOn();
  room.switchOff();
}

*/