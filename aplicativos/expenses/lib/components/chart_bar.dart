import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? day;
  final double? value;
  final double? percentage;

  const ChartBar({
    super.key,
    this.day,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 4.0),
                  child: Text("R\$${value!.toStringAsFixed(2)}"),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[350],
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(day!),
              ),
            ),
          ],
        );
      },
    );
  }
}
