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


Real output:
```
(paste after running)
```

Was I right?
(write yes/no and explain)
