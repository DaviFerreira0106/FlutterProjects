main() {
  for (int a = 0; a < 10; a++) {
    if (a == 6) {
      break;
    }
    print(a);
  }

  print("Fora do for #1");

  for (int a = 0; a < 10; a++) {
    if (a % 2 == 0) {
      continue; // O continue chama a proxima execução, nesse caso ele ignora os números par
    }
    print(a);
  }

  print("Fora do for #2");
}
