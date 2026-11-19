class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor: ": super(owner, balance)" builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 81, L = 1   <-- REPLACE with YOUR student ID numbers
  // Starting balance = 1810 RWF, Bus fare = 281 RWF, Discount = 11%

  BusCard card = BusCard('Danecious Smallwood', 1810); // use YOUR name and balance
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5
  card.owner = 'Danecious Smallwood';
  card.showInfo();

  // TODO 6
  card.topUp(100); // refused
  card.topUp(2000);

  // TODO 7
  card.pay(281);
  card.pay(281);
  card.showInfo();

  // TODO 8
  StudentCard student = StudentCard('Danecious Smallwood', 1810, 11);

  // TODO 9
  student.pay(281);
  student.showInfo();
}
