import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final dynamic venceu;
  final Function onReiniciar;

  const ResultadoWidget({
    super.key,
    required this.venceu,
    required this.onReiniciar,
  });

  Color? _getCor() {
    if (venceu == true) {
      return Colors.green[300];
    } else if (venceu == false) {
      return Colors.red[300];
    } else {
      return Colors.yellow[300];
    }
  }

  IconData _getIcon() {
    if (venceu == true) {
      return Icons.sentiment_very_satisfied_outlined;
    } else if (venceu == false) {
      return Icons.sentiment_very_dissatisfied_outlined;
    } else {
      return Icons.sentiment_satisfied_alt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: Colors.grey),
        child: CircleAvatar(
          backgroundColor: _getCor(),
          child: IconButton(
            padding: const EdgeInsets.symmetric(vertical: 5),
            onPressed: () => onReiniciar(),
            icon: Icon(_getIcon(), size: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
