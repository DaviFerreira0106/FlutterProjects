import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transaction;

  const TransactionList({super.key, this.transaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transaction!.isEmpty
          ? Column(
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
                    height: 250,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transaction!.length,
              itemBuilder: (ctx, index) {
                final Transaction tr = transaction!.elementAt(index);
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            "R\$${tr.value}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    subtitle: Text(
                      DateFormat(" dd MMM y").format(tr.date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
