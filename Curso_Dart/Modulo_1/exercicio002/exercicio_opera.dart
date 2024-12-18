/* 
  Operadores

  - Aritméticos (+, -, *, /, %)
  - Lógicos (&&, ||, ^, !)
  - Atribuição (=, +=, -=, *=, /=, %=)
  - Relacionais (>, >=, <, <=, ==, !=)

*/

void main(){
  // Aritméticos
  var a = 2;
  var b = 8;
  print(a + b); // 10
  print(a - b); // -6
  print(a * b); // 16
  print(a / b); // 0.25
  print(a % b); // 2
  print(b + a); // 10
  print(b - a); // 6
  print(b * a); // 16
  print(b / a); // 4
  print(b % a); // 0
  print(a + b * 4 - 5 / b); // 33.375
  print(b + a - 5 * 4); // -10
  print(45 * b); // 360
  print(b / a + 3); // 7
  print((a + 4) * (b + b)); // 96
  print(a * b - (23 + 56)); // -63

  // Lógicos
  bool estaCalor = true;
  bool estaFrio = false;
  bool estaChovendo = false;
  bool estaComCeuLimpo = true;

  print(estaComCeuLimpo && estaFrio); // false
  print(estaComCeuLimpo && estaCalor); // true
  print(estaFrio || estaCalor); // true
  print(estaFrio || estaChovendo); // false
  print(estaComCeuLimpo && estaCalor && estaFrio); // false
  print(estaChovendo || estaFrio && estaCalor); // false
  print(estaChovendo || estaFrio || estaCalor); // true
}