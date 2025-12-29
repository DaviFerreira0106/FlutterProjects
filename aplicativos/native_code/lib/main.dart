import 'package:flutter/material.dart';

void main() => runApp(const NativeCodeApp());

class NativeCodeApp extends StatefulWidget {
  const NativeCodeApp({super.key});

  @override
  NativeCodeAppState createState() => NativeCodeAppState();
}

class NativeCodeAppState extends State<NativeCodeApp> {
  int _a = 0;
  int _b = 0;
  int _sum = 0;


  
  void _calcSum() {
    setState(() {
      _sum = _a + _b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Código Nativo')),
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Soma: $_sum'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _a = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _b = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: _calcSum, child: Text('Somar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
