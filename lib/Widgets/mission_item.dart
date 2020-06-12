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
    return GestureDetector(
      onTap: () {
        var mission =
            Provider.of<MissionProvider>(context, listen: false).findById(id);
        Provider.of<MissionInitialValue>(context, listen: false)
            .configureInitialValues(mission);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ListTile(
          subtitle: //Padding(
            // padding: const EdgeInsets.only(
            //   left: 16,
            //   right: 16,
            //   bottom: 0,
            //   top: 0,
            // ),
            //child:
             Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          // ),
          // leading: Text(
          //   '${i + 1}.',
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: Colors.white,
          //   ),
          // ),
          title: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 0,
              bottom: 0,
            ),
            child: Text(
              '$name',
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
