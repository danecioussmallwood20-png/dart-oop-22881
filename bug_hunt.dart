class Phone {
  String _brand = ''; // FIX 1: fields need a starting value
  int _battery = 0; // FIX 1

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // FIX 4: setter that accepts only 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // FIX 2: call the parent constructor with super
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // FIX 3: @override removed, because Phone has no restart()
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50); // NOT a bug: "new" is optional but valid
  p.battery = 100;
  print(p.battery); // FIX 5: battery is a getter, so no ()
}
