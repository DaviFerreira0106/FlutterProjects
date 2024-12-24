import './cliente.dart';
import './produto.dart';
import './venda.dart';
import './venda_item.dart';

void main() {
  Venda obj = Venda(
    cliente: Cliente(nome: 'Davi Ferreira', cpf: 'XXXXXXXXXXX'),
    itens: [
      VendaItem(
        produto:
            Produto(codigo: 1, desconto: 0.2, nome: 'Notebook', preco: 3000),
        quantidade: 1,
      ),
    ],
  );

print(obj.valorTotal);
}
