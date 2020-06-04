import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../microtask.dart';

class MicroTaskProvider extends ChangeNotifier {
  List<Microtask> _microList = [];
  List<Microtask> get microList {
    return [..._microList];
  }

  String id;
  Future<int> countDocuments(String id) async {
    QuerySnapshot _myDoc = await Firestore.instance
        .collection('missions')
        .document(id)
        .collection('microtasks')
        .getDocuments();
    List<DocumentSnapshot> _myDocCount = _myDoc.documents;
    return (_myDocCount.length); // Count of Documents in Collection
  }

  Future<void> fetchMicrotask(String id) async {
    _microList.clear();
    final db = Firestore.instance;
    QuerySnapshot _myDoc = await db
        .collection('missions')
        .document(id)
        .collection('microtasks')
        .getDocuments();
    //List<DocumentSnapshot> _myDocCount =
    _myDoc.documents.forEach((element) {
      _microList.add(Microtask.fromMap(element.data));
    });
    print (_microList);
  }

  Future<void> createMicrotask(Microtask microtask, String id) async {
    final db = Firestore.instance;
    int len = await countDocuments(id);
    len++;
    await db.collection('missions').document(id).setData(
      {'microtasksNos': len},
      merge: true,
    );
    await db
        .collection('missions')
        .document(id)
        .collection('microtasks')
        .document('microtask-$len')
        .setData(microtask.toMap());
    for (int i = 1; i <= len; i++) {
      await db
          .collection('missions')
          .document(id)
          .collection('microtasks')
          .document('microtask-$i')
          .setData(
        {'progress': (100 / len).round()},
        merge: true,
      );
    }
  }
}
