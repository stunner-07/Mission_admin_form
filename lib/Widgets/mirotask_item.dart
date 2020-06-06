import 'package:flutter/material.dart';
import 'package:forms/models/providers/initialValue.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:provider/provider.dart';

class MicrotaskItem extends StatelessWidget {
  final String name;
  final int i;
  final String id;
  MicrotaskItem(this.name, this.i, this.id);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: GestureDetector(
          onTap: () {
            //print(id);
            var micro = Provider.of<MicroTaskProvider>(context, listen: false)
                .findById(id);
            //print(micro.name);
            Provider.of<InitialValue>(context, listen: false)
                .configureInitialValues(id, micro);
          },
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                '#${i + 1}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            title: Text(
              '$name',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ));
  }
}
