/* 
ISP(Interface Segregation Principle)
=> ISP states that client(class) shouldn't be forced to depend upon(implement) interfaces that they don't use.
=> Interface Segregation Principle focuses on keeping interfaces slim & relevant to the clients that implement them.
*/

abstract interface class Worker {
  void work();
  void eat();
}

// Here if the Engineer & Teacher wanna implement the Worker interface, they both need to override both the void method but some time there might come a case where Engineer class is not eating but only working & vice versa, Hence in such case it becomes hectic as both the method need to be implemented.
class Engineer implements Worker {
  @override
  void eat() {
    print("Engineer is having his/her dinner");
  }

  @override
  void work() {
    print("Engineer is working on the project");
  }
}

class Teacher implements Worker {
  @override
  void eat() {
    print("Teacher is having his/her lunch");
  }

  @override
  void work() {
    print("Teacher is teaching linear algebra");
  }
}

/* 
Instead, we can make multiple interfaces which will be specific for specific use case & based on the need, other class implements it.
This division of roles help us to keep the interface slim & most relevant to the client(class) which implement them.
 */
abstract interface class Eater {
  void eating();
}

abstract interface class worker {
  void working();
}

class Mechanic implements worker {
  @override
  void working() {
    print("Mechanic is working on supra");
  }
}

class Customer implements Eater {
  @override
  void eating() {
    print("Customer is eating their food");
  }
}

void main(List<String> args) {
  // Instantiate and demonstrate the behavior of each class based on their specific roles
  Mechanic mechanic = Mechanic();
  mechanic.working();

  Customer customer = Customer();
  customer.eating();
  print("-----------------------------------------------");

  Engineer engineer = Engineer();
  engineer.work();
  engineer.eat();
  print("-----------------------------------------------");

  Teacher teacher = Teacher();
  teacher.work();
  teacher.eat();
}
