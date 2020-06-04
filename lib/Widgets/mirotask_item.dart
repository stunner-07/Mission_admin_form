import 'package:flutter/material.dart';

class MicrotaskItem extends StatelessWidget {
  final String id;
  MicrotaskItem(this.id);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ListTile(
          leading: Text(id),
        ));
  }
}
