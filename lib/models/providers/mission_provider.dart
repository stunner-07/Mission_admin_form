import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../mission.dart';

class MissionProvider extends ChangeNotifier{
  String id;
  Future<void> createMission(Missions missions) async {
    final db = Firestore.instance;
    final response = await db.collection('missions').add(missions.toMap());
    missions.missionId = response.documentID;
    id=missions.missionId;
    notifyListeners();
    addDetail(missions, db);
  }

  Future<void> addDetail(Missions missions, Firestore db) async {
    await db
        .collection('missions')
        .document(missions.missionId)
        .collection('details')
        .document('details')
        .setData({'details': missions.details});
  }

}