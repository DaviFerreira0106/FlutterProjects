import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_textfield.dart';
import 'dart:io';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)? onSubmit;

  const TransactionForm({super.key, this.onSubmit});

  @override
  TransactionFormState createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _datePiker = DateTime.now();

  void _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit!(title, value, _datePiker);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }

      setState(() {
        _datePiker = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          AdaptativeTextField(
            label: "Titulo",
            textController: _titleController,
          ),
          AdaptativeTextField(
            label: "R\$ Valor",
            textController: _valueController,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                if (Platform.isAndroid)
                  Expanded(
                    child: Text(
                      "Data Selecionada: ${DateFormat("dd/MM/yyyy").format(_datePiker)}",
                    ),
                  ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text("Selecionar Data"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AdaptativeButton(
                label: "Nova Transação",
                onPressed: _submitForm,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
