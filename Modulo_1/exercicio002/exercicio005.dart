/*

  - List
  - Map
  - Set
 */

main() {
  //List
  List nomes = ['Ana', 'Davi', 'Elenita', 'Laura', true, 123];
  print(nomes.length);
  nomes.add('Mariana');
  print(nomes.length);
  print(nomes.elementAt(2));
  print(nomes[1]);
  print(nomes);

  //Map
  Map telefones = {
    'João': '+55 (11) 7777-7777',
    'Davi': '+55 (21) 97777-7777',
    123: '+55 (11) 97777-7777',
  };
  print(telefones.length);
  print(telefones['Davi']);
  print(telefones.values);
  print(telefones.keys);
  print(telefones.entries);
  print(telefones);

  //Set
  Set times = {'Vasco', 'Flamengo', 'Palmeiras', 'São Paulo'};
  print(times.length);
  times.add('Santos'); //Não é permitido repetições de valores
  times.add('Santos');
  print(times.length);
  print(times.last);
  print(times.first);
  print(times.contains('Palmeiras'));
  print(times);
}
