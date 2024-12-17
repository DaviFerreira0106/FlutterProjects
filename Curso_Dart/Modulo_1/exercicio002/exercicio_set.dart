

void main(){
  // 1. Crie um Set
  const Set times = {'Palmeiras', 'Santos', 'Flamengo', 'Gremio', 'Internacional', 'Vasco', 'São Paulo', 'Cruzeiro'};
  print(times.length);
  print(times);

  // 2. Adicione valores no Set
  final Set carros = {'Ferrari', 'Mercedes', 'BMW', 'Mustang', 'Camaro', 'Corolla', 'Calhambeck'};
  carros.add('Opala');
  print(carros);

  // 3. Acesse um valor especifico do Set
  const Set compras = {'Arroz', 'Feijão', 'Açucar', 'Carne', 'Frango', 'Peixe', 'Tempero', 'Sal', 'Café'};
  print(compras.elementAt(2));
  print(compras.first);
  print(compras.last);

  // 4. Remova um valor especifico do Set
  final Set numeros = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  numeros.remove(4);
  print(numeros);

  // 5. Remova mais de uma valor no Set
  final Set nomes = {'Davi', 'Roberto', 'Diego', 'Nicolas', 'Luana', 'Dalva', 'Damiana'};
  nomes.removeAll({'Davi', 'Damiana', 'Roberto'});
  print(nomes);

  // 6. Remova um valor com uma condição
  final Set marcas = {'Nike', 'Adidas', 'Puma', 'New Balance', 'Lacoste', 'Polo', 'Olympicos'};
  marcas.removeWhere((element)=> element == 'Lacoste' || element == 'Polo',);
  print(marcas);

  // 7. Verifique se um valor especifico está presente no Set
  const Set comidas = {'Pizza', 'Macarrão', 'Salada', 'X-Burguer', 'Batata Frita', 'Pipoca', 'Palha Italiana'};
  print(comidas.where((element) => element == 'Pipoca',));

  // 8. Adicione varios valores no Set
  final Set objetos = {};
  objetos.addAll({'Mesa', 'Cadeira', 'Sofá', 'Cama', 'Mobilia', 'Portas', 'Janelas', 'Lampadas'});
  print(objetos);

}