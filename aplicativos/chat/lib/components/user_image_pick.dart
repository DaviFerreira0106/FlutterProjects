import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePick extends StatefulWidget {
  final void Function(File image) onImage;

  const UserImagePick({
    super.key,
    required this.onImage,
  });

  @override
  UserImagePickState createState() => UserImagePickState();
}

class UserImagePickState extends State<UserImagePick> {
  File? _image;

  Future<void> _pickedImage() async {
    final pickImage = ImagePicker();
    final imagePicked = await pickImage.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (imagePicked != null) {
      setState(() => _image = File(imagePicked.path));
    }

    widget.onImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        TextButton.icon(
          onPressed: _pickedImage,
          label: Text('Selecionar Image'),
          icon: Icon(Icons.image),
        ),
      ],
    );
  }
}
