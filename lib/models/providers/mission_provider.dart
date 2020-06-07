import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../mission.dart';

class MissionProvider extends ChangeNotifier {
  List<Missions> _missionList = [];
  List<Missions> get missionList {
    return [..._missionList];
  }
  

  String id;
  Missions findById(String id) {
    return _missionList.firstWhere((element) => element.missionId == id);
  }
  Future<void> createMission(Missions missions) async {
    final db = Firestore.instance;
    final response = await db.collection('missions').add(missions.toMap());
    missions.missionId = response.documentID;
    id = missions.missionId;
    notifyListeners();
    addDetail(missions, db);
  }

  Future<void> fetchMissions() async {
    _missionList.clear();
    final db = Firestore.instance;
    QuerySnapshot _myDoc = await db.collection('missions').getDocuments();
    _myDoc.documents.forEach((element) async {
      // var detail = await db
      //     .collection('missions')
      //     .document(element.documentID)
      //     .collection('details')
      //     .document('details')
      //     .get();

      _missionList
          .add(Missions.fromMap(element.data, element.documentID));
    });
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
