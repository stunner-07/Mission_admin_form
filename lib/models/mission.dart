import 'package:cloud_firestore/cloud_firestore.dart';

class Missions {
  String missionId;
  String companyId;
  String img;
  String difficulty;
  int microtasksNos;
  String name;
  List<String> tags;
  String details;
  Missions({
    this.missionId,
    this.companyId,
    this.img,
    this.difficulty,
    this.microtasksNos,
    this.name,
    this.tags,
    this.details,
  });

  Future<void> createMission(Missions missions) async {
    final db = Firestore.instance;
    final response = await db.collection('missions').add(missions.toMap());
    missions.missionId = response.documentID;
    await db.collection('missions').document(missions.missionId).setData(
      {'missionId': missions.missionId},
      merge: true,
    );
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

  Map<String, dynamic> toMap() {
    return {
      'missionId': missionId,
      'companyId': companyId,
      'img': img,
      'difficulty': difficulty,
      'microtasksNos': microtasksNos,
      'name': name,
      'tags': tags,
      //'details': details,
    };
  }

  static Missions fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Missions(
      missionId: map['missionId'],
      companyId: map['companyId'],
      img: map['img'],
      difficulty: map['difficulty'],
      microtasksNos: map['microtasksNos'],
      name: map['name'],
      tags: List<String>.from(map['tags']),
      details: map['details'],
    );
  }
}
