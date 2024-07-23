import "dart:io";

main() {
  // Operador Ternário
  stdout.write("Está chovendo? (s/N) ");
  final bool chovendo =
      stdin.readLineSync()! == "s"; // O ! garante que terá uma resposta.

  stdout.write("Está frio? (s/N) ");
  final bool frio = stdin.readLineSync()! == "s";

  final String resposta = chovendo && frio ? "Ficar em casa!!!" : "Sair!!!";
  print(resposta);
  print(resposta == "Ficar em casa!!!" ? "Azarado!" : "Sortudo!");
}
