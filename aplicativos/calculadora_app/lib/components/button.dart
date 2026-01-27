import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const Color darkColor = Color.fromRGBO(82, 82, 82, 1);
  static const Color defaultColor = Color.fromRGBO(112, 112, 112, 1);
  static const Color operationColor = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  const Button({
    super.key,
    required this.text,
    this.big = false,
    this.color = defaultColor,
    required this.cb,
  });

  const Button.big({
    super.key,
    required this.text,
    this.big = true,
    this.color = defaultColor,
    required this.cb,
  });

  const Button.operation({
    super.key,
    required this.text,
    this.big = false,
    this.color = operationColor,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        onPressed: () => cb(text),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
