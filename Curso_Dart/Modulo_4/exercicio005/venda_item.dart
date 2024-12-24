import './produto.dart';

class VendaItem {
  Produto? produto;
  int? quantidade;
  double? _preco;

  VendaItem({this.produto, this.quantidade = 1});

  double get preco {
    if(produto != null && _preco == null){
      _preco = produto!.precoDesconto;
    }
    return _preco!;
  }

  void set preco(double precoNovo){
    if(precoNovo > 0){
      _preco = precoNovo;
    }
  }
}