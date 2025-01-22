import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:expenses/models/transaction.dart';

class AdaptativeListTile extends StatelessWidget {
  final Transaction? tr;
  final void Function(String)? onRemove;

  const AdaptativeListTile({super.key, this.tr, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CupertinoListTile(
                  leadingSize: 60,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          "R\$${tr!.value.toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr!.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    DateFormat(" dd MMM y").format(tr!.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          onPressed: () => onRemove!(tr!.id),
                          label: Text(
                            "Excluir",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        )
                      : IconButton(
                          onPressed: () => onRemove!(tr!.id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                ),
                Divider(),
              ],
            ),
          )
        : Card(
            elevation: 1,
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text(
                      "R\$${tr!.value.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(
                tr!.title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              subtitle: Text(
                DateFormat(" dd MMM y").format(tr!.date),
                style: TextStyle(color: Colors.grey),
              ),
              trailing: MediaQuery.of(context).size.width > 480
                  ? TextButton.icon(
                      onPressed: () => onRemove!(tr!.id),
                      label: Text(
                        "Excluir",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    )
                  : IconButton(
                      onPressed: () => onRemove!(tr!.id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
            ),
          );
  }
}
