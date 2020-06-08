import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../mission.dart';

class MissionProvider extends ChangeNotifier {
  List<Missions> _missionList =[];
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
    await addDetail(missions, db);
  }

  Future<void> updateMission(Missions missions, String missionId) async {
    final db = Firestore.instance;
    await db
        .collection('missions')
        .document(missionId)
        .setData(missions.toMap());
    await updateDetail(missions, db, missionId);
    id = missionId;
    notifyListeners();
  }

  Future<void> fetchMissions() async {
    _missionList.clear();
    final db = Firestore.instance;
    QuerySnapshot _myDoc = await db.collection('missions').getDocuments();
    _myDoc.documents.forEach((element) async {
      _missionList
          .add(Missions.fromMap(element.data, element.documentID));
    });
    _myDoc.documents.forEach((element) async{
       String det=await fetchDetail(element.documentID);
       Missions mi=_missionList.firstWhere((m) => m.missionId==element.documentID);
       mi.details=det;
    });
    //print(_missionList.length);
  }
  Future<String> fetchDetail(String missId) async {
    final db=Firestore.instance;
    var det= await db
        .collection('missions')
        .document(missId)
        .collection('details')
        .document('details')
        .get();
    return det.data['details'];
  }
  Future<void> updateDetail(Missions missions, Firestore db, String id) async {
    await db
        .collection('missions')
        .document(id)
        .collection('details')
        .document('details')
        .setData({'details': missions.details});
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
