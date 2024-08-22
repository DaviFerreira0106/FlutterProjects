import 'produto.dart';

class VendaItem {
  Produto? produto;
  int? quantidade;
  double? _preco;

  VendaItem({this.produto, this.quantidade});

  double get getPreco {
    if (produto != null && _preco == null) {
      _preco = produto!.precoComDesconto;
    }
    return _preco!;
  }

  void set setPreco(double novoPreco) {
    if (novoPreco > 0) {
      _preco = novoPreco;
    }
  }
}
