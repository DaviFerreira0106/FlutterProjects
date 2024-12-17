void main(){
  // 1. Crie um Map
  const Map telefones = {
    'Davi': '+55 (11) 99999-9999',
    'Laura': '+55 (11) 88888-9999',
    'Mariana': '+55 (11) 77777-9999',
    'Elenita': '+55 (11) 66666-9999',
    'Carlito': '+55 (11) 55555-9999',
  };
  print(telefones.length);
  print(telefones);

  // 2. Acesse os valores do Map
  const Map notas = {
    'Davi': 10.0,
    'Laura': 8.9,
    'Mariana': 9.0,
    'Elenita': 4.5,
    'Carlito': 5.6,
    'Soraia': 7.8,
    'Elisa': 7.0,
    'Gabriel': 7.1,
    'Miguel': 6.5,
    'Levi': 8.7,
  };

  print(notas.values);

  // 3. Acesse as chaves do Map
  const Map alunosAprovados = {
    'Aprovados': ["Davi", "Laura", "Mariana", "Elenita", "Carlito"],
    'Recuperação': ["Levi", "Elisa", "Gabriel", "Miguel", "Joaquim"],
    'Reprovados': ["Taina", "Larissa", "Junior", "Eduardo", "Roberto"],
  };

  print(alunosAprovados.keys);

  // 4. Acesse chave e valor do Map
  const Map alunosNotas = {
    'Aprovados': {'Davi': 10.0, 'Laura': 9.5, 'Mariana': 8.8, 'Elenita': 7.6, 'Carlito': 9.9},
    'Recuperação': {'Levi': 5.5, 'Elisa': 6.4, 'Gabriel': 5.8, 'Miguel': 6.0, 'Joaquim': 6.1},
    'Reprovados': {'Taina': 3.5, 'Larissa': 2.2, 'Junior': 3.8, 'Eduardo': 1.7, 'Roberto': 2.9},
  };

  print(alunosNotas.entries);
  print(alunosNotas.length);
  
  // 5. Acesse um valor especifico do Map
  const Map alunosNotas2 = {
    'Aprovados': {'Davi':9.8,'Laura':8.6,'Mariana':7.9,'Elenita':9.3,'Carlito':8.7},
    'Recuperação': {'Giovani':6.8,'Vitor':5.4,'Guilherme':5.8,'Gabriel':4.3,'João':6.1},
    'Reprovados': {'Victor':3.7,'Murillo':3.4,'Iago':2.3,'Yago':1.6,'Danilo':3.0},
  };

  print(alunosNotas2["Aprovados"]);
  
  // 6. Adicione valor no Map
  final Map numeros = {
    'Impar': [1, 3, 5, 7, 9, 11, 13, 15, 17, 19],
    'Par': [2, 4, 6, 8, 10, 12, 14, 16, 18, 20],
  };

  numeros.addAll({'Primos': [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]});

  print(numeros);

  // 7. Adicione varios valores no Map
  final Map tabela = {
    [10, 9, 8, 7]: "Prêmios Top!",
    [6, 5, 4]: "Prêmios Regulares",
  };

  var valores = {[3, 2, 1]: "Prêmios de baixo nível"};
  tabela.addEntries(valores.entries);
  print(tabela);

  // 8. Remova valores no Map
  final Map animais = {
    'Silvestres': ['Leão', 'Onça', 'Cobra', 'Elefante', 'Arara'],
    'Domesnticos': ['Cachorro', 'Piriquioto', 'Gato'],
  };

  animais.remove('Silvestres');
  print(animais.entries);

  // 9. Remova varios valores no Map
  final Map produtos = {
    'Teclado': 159.99,
    'Mouse': 110.20,
    'Monitor': 445.99,
    'Gabinete': 499.99,
    'Cpu': 1345.99,
  };

  produtos.removeWhere((key, value) => key == 'Teclado' || key == 'Gabinete',);
  print(produtos.entries);

  // 10. Substitua valores no Map
  final Map avaliacao = {
    'C&A': 4,
    'Besni': 3,
    'Renner': 4,
    'Surfin': 5,
    'Outlet': 2,
  };

  avaliacao.update('Outlet', (value)=> 5);

  print(avaliacao.entries);
}