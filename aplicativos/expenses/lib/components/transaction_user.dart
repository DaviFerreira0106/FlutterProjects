import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_form.dart';
import 'dart:math';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  TransactionUserState createState() {
    return TransactionUserState();
  }
}

class TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _transaction = [
    Transaction(
      id: "t1",
      title: "Novo Tênis de Corrida",
      value: 380.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Conta de luz",
      value: 211.60,
      date: DateTime.now(),
    )
  ];

  void _addTransaction(String title, double value) {
    final Transaction newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: _addTransaction), // Comunicação indireta
        TransactionList(transaction: _transaction), // Comunicação direta
      ],
    );
  }
}
