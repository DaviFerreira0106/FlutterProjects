import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;
  const EntradaTempo({
    super.key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titulo, style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: dec,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.red,
              ),
              child: Icon(Icons.arrow_downward, color: Colors.white),
            ),
            Text('$valor min', style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: inc,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.red,
              ),
              child: Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
