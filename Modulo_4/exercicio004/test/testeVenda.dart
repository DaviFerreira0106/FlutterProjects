import '../model/venda.dart';
import '../model/cliente.dart';
import '../model/produto.dart';
import '../model/vendaItem.dart';

void main() {
  Venda objVenda = new Venda(
    cliente: Cliente(cpf: '324.653.189-09', nome: 'Davi Ferreira'),
    itens: [
      VendaItem(
        produto: Produto(
          codigo: 1,
          desconto: 0.15,
          nome: 'Celular',
          preco: 1970.99,
        ),
        quantidade: 1,
      ),
      VendaItem(
        produto: Produto(
          codigo: 2,
          desconto: 0.1,
          nome: 'Computador',
          preco: 2987.99,
        ),
        quantidade: 2,
      ),
    ],
  );

  Iterable<Produto> item = objVenda.itens!
      .map((itemVenda) => itemVenda.produto!);

  print(item);
}
