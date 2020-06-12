import 'package:flutter/material.dart';
import 'package:forms/Widgets/mission_item.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class ListMissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mission = Provider.of<MissionProvider>(context);
    return Card(
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(color: Color.fromRGBO(63, 63, 62, 1), width: 1),
      // ),
      elevation: 8,
      child: Container(
        color: Color.fromRGBO(251, 244, 249, 1),
        width: 450,
        height: 550,
        child: FutureBuilder(
            future: mission.fetchMissions(),
            builder: (ctx, snapshot) {
              //print(mission.missionList.length);
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : mission.missionList.length != 0
                      ? ListView.builder(
                          itemBuilder: (_, i) {
                            return Column(
                              children: <Widget>[
                                if (i == 0)
                                  Container(
                                    //alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 30,
                                      bottom: 10,
                                      right: 20,
                                    ),
                                    child: Text(
                                      'List of Missions',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                if (i == 0)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 30),
                                    child: Divider(
                                      thickness: 0.3,
                                      color: Colors.grey,
                                    ),
                                  ),
                                MissionItem(
                                  mission.missionList[i].name,
                                  i,
                                  mission.missionList[i].missionId,
                                ),
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
                        );
            }),
      ),
    );
  }
}
