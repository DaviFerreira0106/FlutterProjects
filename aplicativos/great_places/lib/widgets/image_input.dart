import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({super.key, required this.onSelectImage});

  @override
  ImageInputState createState() => ImageInputState();
}

class ImageInputState extends State<ImageInput> {
  File? _storeImage;

  void _takePickture() async {
    final ImagePicker picker = ImagePicker();
    XFile imagePicker = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() => _storeImage = File(imagePicker.path));

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storeImage!.path);
    final saveImage = await _storeImage!.copy('${appDir.path}/$fileName');

    widget.onSelectImage(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storeImage != null
              ? Image.file(
                  _storeImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('Nenhuma imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePickture,
            label: Text('Tirar Foto'),
            icon: Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}
