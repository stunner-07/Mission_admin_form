import 'package:flutter/material.dart';
import 'package:forms/Widgets/mission_item.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class ListMissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mission = Provider.of<MissionProvider>(context);
    return Card(
      elevation: 10,
      child: Container(
        width: 500,
        height: 450,
        child: FutureBuilder(
            future: mission.fetchMissions(),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : mission.missionList.length != 0
                        ? ListView.builder(
                            itemBuilder: (_, i) {
                              return Column(
                                children: <Widget>[
                                  MissionItem(
                                    mission.missionList[i].name,
                                    i,
                                    mission.missionList[i].missionId,
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                            itemCount: mission.missionList.length,
                          )
                        : Center(
                            child: Text(
                              "Add Some Missions!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          )),
      ),
    );
  }
}
