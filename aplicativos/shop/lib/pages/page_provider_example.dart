import 'package:flutter/material.dart';
import 'package:shop/observer/counter_provider.dart';

class PageProviderExample extends StatefulWidget {
  const PageProviderExample({super.key});

  @override
  PageProviderExampleState createState() {
    return PageProviderExampleState();
  }
}

class PageProviderExampleState extends State<PageProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exemplo Provider"),
        ),
        body: Column(
          children: [
            Text(CounterProvider.of(context)?.state.value.toString() ?? "0"),
            IconButton(
              onPressed: () => setState(() {
                CounterProvider.of(context)?.state.inc();
              }),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => setState(() {
                CounterProvider.of(context)?.state.dec();
              }),
              icon: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
