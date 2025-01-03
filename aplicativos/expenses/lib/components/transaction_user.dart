import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_form.dart';

class TransactionUser extends StatefulWidget {

  const TransactionUser({super.key});

  @override
  TransactionUserState createState(){
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

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        TransactionList(transaction: _transaction),
        TransactionForm(),
      ],
    );
  }
}