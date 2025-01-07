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
    return Column(
      children: [
        Text("R\$ ${value!.toStringAsFixed(2)}"),
        SizedBox(height: 10),
        SizedBox(
          height: 60,
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
        SizedBox(height: 10),
        Text(day!),
      ],
    );
  }
}
