import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double)? onSubmit;

  TransactionForm({super.key, this.onSubmit});

  void _submitForm() {
    final String title = titleController.text;
    final double value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit!(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            onChanged: (_) => _submitForm(),
            decoration: InputDecoration(labelText: "Título"),
          ),
          TextField(
            controller: valueController,
            onChanged: (_) => _submitForm(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: "R\$ Valor"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _submitForm,
                child: Text(
                  "Nova Transação",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
