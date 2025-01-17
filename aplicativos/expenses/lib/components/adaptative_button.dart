import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;

  const AdaptativeButton({super.key, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: onPressed!,
            child: Text(
              label!,
              style: TextStyle(
                color: Theme.of(context).buttonTheme.colorScheme!.secondary,
              ),
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: onPressed,
            child: Text(
              label!,
              style: TextStyle(
                color: Theme.of(context).buttonTheme.colorScheme!.secondary,
              ),
            ),
          );
  }
}
