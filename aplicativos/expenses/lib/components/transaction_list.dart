import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenses/components/adaptative_list_tile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transaction;
  final void Function(String)? onRemove;

  const TransactionList({super.key, this.transaction, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transaction!.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      "Nenhuma Transação Cadastrada!",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png'),
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transaction!.length,
            itemBuilder: (ctx, index) {
              final Transaction tr = transaction!.elementAt(index);
              return AdaptativeListTile(tr: tr, onRemove: onRemove);
            },
          );
  }
}
