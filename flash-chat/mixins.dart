// [Dart] Mixins

void main() {
//   Animal().move();
//   Fish().move();
//   Bird().move();
  Duck().swim();
  Duck().fly();
}

class Animal {
  void move() {
    print('changed position');
  }
}

class Fish extends Animal {
  @override
  void move() {
    super.move();
    print('by swimming');
  }
}

class Bird extends Animal {
  @override
  void move() {
    super.move();
    print('by flying');
  }
}

// only 1 class to extend
// class Duck extends Fish or Bird {} // can't be both

// Mixin as a solution

mixin CanSwim {
  void swim() {
    print('Changing position by swiming');
  }
}

mixin CanFly {
  void fly() {
    print('Changing position by flying');
  }
}

// with + mixin, mixins
class Duck with CanSwim, CanFly {}
