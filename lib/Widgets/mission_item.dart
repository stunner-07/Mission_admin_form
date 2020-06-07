import 'package:flutter/material.dart';
import 'package:forms/models/providers/initialValue_mission.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class MissionItem extends StatelessWidget {
  final String name;
  final int i;
  final String id;
  MissionItem(this.name, this.i, this.id);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: GestureDetector(
          onTap: () {
            var mission = Provider.of<MissionProvider>(context, listen: false)
                .findById(id);
            Provider.of<MissionInitialValue>(context, listen: false)
                .configureInitialValues(mission);
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
