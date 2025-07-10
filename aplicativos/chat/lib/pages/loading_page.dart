import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryTextTheme.headlineSmall?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
