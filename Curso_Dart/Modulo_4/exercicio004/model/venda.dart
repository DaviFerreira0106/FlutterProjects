import './cliente.dart';
import './vendaItem.dart';

class Venda {
  Cliente? cliente;
  List<VendaItem>? itens;

  Venda({this.cliente, this.itens = const []});

  double get valorTotal {
    return itens!
        .map((item) => item.getPreco)
        .reduce((acumulador, elemento) => acumulador + elemento);
  }
}
