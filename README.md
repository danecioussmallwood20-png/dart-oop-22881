# Dart OOP Assignment: Kigali Bus Card

**Name:** Danecious Smallwood
**Student ID:** 22881

## My numbers
- D = 81, L = 1
- Starting balance = 1810 RWF
- Bus fare = 281 RWF
- Student discount = 11%

## Output of main.dart
```
Error: name too short
Owner: Danecious Smallwood | Balance: 1810 RWF
Owner: Danecious Smallwood | Balance: 1810 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 281 RWF
Paid 281 RWF
Owner: Danecious Smallwood | Balance: 3248 RWF
Student discount: 30 RWF
Paid 251 RWF
Owner: Danecious Smallwood | Balance: 1559 RWF
Student card: 11% off
```

## Part 1: Why no setter for balance?
A setter would let any code set the balance to any number, for example
`card.balance = 999999`. With no setter, the balance can only change through
`topUp` and `pay`, which both check rules first (top-up from 500 to 50000,
and no paying more than the balance). This protects the money on the card.

## Part 2: What does ~/ do?
`~/` is integer division: it divides and drops the decimal part.
`print(237 * 17 / 100);` prints `40.29` (normal division gives a double).
`print(237 * 17 ~/ 100);` prints `40` (integer division gives an int).
The discount is in whole RWF, so I use `~/`.

## Part 4: Bug table
| Bug | The line | Why it is wrong (my words) | My fix |
|-----|----------|----------------------------|--------|
| 1 | `String _brand; int _battery;` | Dart does not allow non-nullable fields with no starting value | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(...) {` | The child constructor never calls the parent constructor | add `: super(brand, battery)` |
| 3 | `@override void restart()` | `@override` needs a parent method with that name, and Phone has no `restart` | remove `@override` |
| 4 | `p.battery = 100;` | There is a getter but no setter, so it cannot be assigned | add `set battery(int value)` accepting 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it has no `()` | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | `new` is optional in Dart but still valid | (none) |

## Part 5
My prediction:

The program prints 1 and then 5.

For a (a normal Bag): add() adds 1 to _items, so it is 1.
Then a.items = -5 calls the setter. The setter only accepts values
that are 0 or more, so -5 is refused and _items stays 1.
So print(a.items) prints 1.

For b (a BigBag): BigBag overrides add() and calls super.add()
two times, so each add() adds 2. I call b.add() twice, so
_items goes 0 -> 2 -> 4. Then b.items = b.items + 1 sets it to
4 + 1 = 5, which is allowed because it is not below 0.
So print(b.items) prints 5.

Real output:
'''

1
5
'''


Was I right?
Yes, I was right. The program printed 1 and then 5, the same as my prediction.

For a, I called add() once, so _items became 1. Then I tried a.items = -5. The setter only accepts values that are 0 or more, so it refused -5 and _items stayed 1. That is why the first line printed 1.

For b, BigBag overrides add() and calls super.add() two times, so each add() gives 2 items instead of 1. I called b.add() twice, so _items went from 0 to 2 to 4. Then b.items = b.items + 1 set it to 5, and the setter accepted it because 5 is not below 0. That is why the second line printed 5.