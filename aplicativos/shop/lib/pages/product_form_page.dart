import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  ProductFormPageState createState() {
    return ProductFormPageState();
  }
}

class ProductFormPageState extends State<ProductFormPage> {
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocus),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Preço"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocus),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Descrição"),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
