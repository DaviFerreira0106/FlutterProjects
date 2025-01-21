import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

// ignore: must_be_immutable
class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectDate;
  final void Function(DateTime)? onDateChanged;

  const AdaptativeDatePicker({super.key, this.onDateChanged, this.selectDate});

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      onDateChanged!(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged!,
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Data Selecionada: ${DateFormat("dd/MM/yyyy").format(selectDate!)}",
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text("Selecionar Data"),
                ),
              ],
            ),
          );
  }
}
