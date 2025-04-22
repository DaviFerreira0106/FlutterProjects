import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/models/product.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null) {
      final Product prod = args as Product;
      _formData['id'] = prod.id;
      _formData['price'] = prod.price;
      _formData['description'] = prod.description;
      _formData['imageUrl'] = prod.imageUrl;
      _formData['name'] = prod.title;
      _imageUrlController.text = prod.imageUrl;
    }
  }

  void updateImageUrl() {
    setState(() {});
  }

  bool validateImage(String url) {
    final bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    final bool isValidEndsWith = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpeg') ||
        url.toLowerCase().endsWith('.jpg');

    return isValidUrl && isValidEndsWith;
  }

  void submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(context, listen: false)
        .saveProduct(data: _formData);

    Navigator.of(context).pop();
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
                initialValue: _formData['name'].toString(),
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
                  initialValue: _formData['price'].toString(),
                  decoration: InputDecoration(labelText: "Preço"),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  focusNode: _priceFocus,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_descriptionFocus),
                  onSaved: (price) =>
                      _formData['price'] = double.parse(price ?? '0'),
                  validator: (valuePrice) {
                    final String priceString = valuePrice ?? '';
                    final double price = double.tryParse(priceString) ?? -1;

                    if (price <= 0) {
                      return "Digite um valor válido!";
                    }

                    return null;
                  }),
              TextFormField(
                  initialValue: _formData['description'].toString(),
                  decoration: InputDecoration(labelText: "Descrição"),
                  focusNode: _descriptionFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (description) =>
                      _formData['description'] = description ?? '',
                  validator: (descriptionValue) {
                    final String description = descriptionValue ?? '';

                    if (description.trim().isEmpty) {
                      return "A descrição não pode ser vazia!";
                    }

                    if (description.trim().length < 10) {
                      return "A descrição precisa ter no mínimo 10 letras!";
                    }

                    return null;
                  }),
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
                        validator: (imageUrlValue) {
                          final String imageUrl = imageUrlValue ?? '';

                          if (!validateImage(imageUrl)) {
                            return "Digite uma url válida!";
                          }

                          return null;
                        }),
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
