/*
=> Liskov Substitution have more of a mathematical statement:
  Let φ(x){phi of x} be a property provable about objects x of type T, then φ(y) should be true for objects y of type S where S is subtype of T.

Simply, it means that objects of a superclass should be replacable with objects of its subclasses without effecting the correctness of a program.
*/

abstract class Animal {
  void makeSound();
}

class Lion extends Animal {
  @override
  void makeSound() {
    print("Lion sounds roarrrrr!!");
  }
}

void makeAnimalSound(Animal animal) {
  animal.makeSound();
}

void main(List<String> args) {
  // Storing the ref of Lion class to instance of Animal class. This is allowed since Lion is extending Animal abstract class.
  Animal animal = new Lion(); //* It shows that object of a superclass ca be replaced with obj of subclass without effecting correctness of program
  makeAnimalSound(animal);
}
/*
* The idea is that if a class B is a subclass of class A, then objects of A can be substituted with objects of B without altering the expected behavior of the program. In other words, subclasses should respect the "contract" established by their superclasses and not introduce unexpected behavior. 
*/