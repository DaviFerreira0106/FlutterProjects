import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'dart:math';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  ProductFormPageState createState() {
    return ProductFormPageState();
  }
}

class ProductFormPageState extends State<ProductFormPage> {
  // Variáveis de controle de foco
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _imageUrlFocus = FocusNode();

  // Variável de controle de texto
  final TextEditingController _imageUrlController = TextEditingController();

  // Chave do formulário
  final _formKey = GlobalKey<FormState>();

  // Objeto de armazenamento dos dados do formulário
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImageUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImageUrl);
    _imageUrlFocus.dispose();
  }

  void updateImageUrl() {
    setState(() {});
  }

  void submitForm() {
    _formKey.currentState?.validate();

    _formKey.currentState?.save();

    final Product newProduct = Product(
      id: Random().nextDouble().toString(),
      title: _formData['name'] as String,
      description: _formData['description'] as String,
      price: _formData['price'] as double,
      imageUrl: _formData['imageUrl'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Produto"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => submitForm(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocus),
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (valueName) {
                  final String name = valueName ?? '';

                  if (name.trim().isEmpty) {
                    return "Nome é obrigatório!";
                  }

                  if (name.trim().length < 3) {
                    return "O nome precisa ter no mínimo 3 letras!";
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Preço"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocus),
                onSaved: (price) =>
                    _formData['price'] = double.parse(price ?? '0'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Descrição"),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (description) =>
                    _formData['description'] = description ?? '',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Url da Imagem"),
                      focusNode: _imageUrlFocus,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => submitForm(),
                      onSaved: (imageUrl) =>
                          _formData['imageUrl'] = imageUrl ?? '',
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text("Informe a Url")
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              _imageUrlController.text,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
