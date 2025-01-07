import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction>? recentTransaction;

  const Chart({super.key, this.recentTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (int i = 0; i < recentTransaction!.length; i++) {
        bool sameDay = recentTransaction!.elementAt(i).date.day == weekDay.day;
        bool sameMonth =
            recentTransaction!.elementAt(i).date.month == weekDay.month;
        bool sameYear =
            recentTransaction!.elementAt(i).date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction!.elementAt(i).value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: groupedTransaction.map((tr) {
            return Text("${tr['day']}: ${tr['value']}");
          }).toList(),
        ),
      ),
    );
  }
}
