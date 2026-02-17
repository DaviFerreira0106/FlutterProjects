import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onClick;
  const CronometroBotao({
    super.key,
    required this.text,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}
