import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../microtask.dart';

class MicroTaskProvider extends ChangeNotifier{
  String id;
  Future<int> countDocuments(String id) async {
    QuerySnapshot _myDoc = await Firestore.instance.collection('missions')
        .document(id)
        .collection('microtasks').getDocuments();
    List<DocumentSnapshot> _myDocCount = _myDoc.documents;
    return (_myDocCount.length);  // Count of Documents in Collection
}
  Future<void> createMicrotask(Microtask microtask, String id) async {
    final db = Firestore.instance;
    int len=await countDocuments(id);
    len++;
    await db
        .collection('missions')
        .document(id)
        .collection('microtasks')
        .document('microtask-$len')
        .setData(microtask.toMap());
  }
}