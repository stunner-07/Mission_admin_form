

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Microtask {
  String answer;
  String detail;
  String name;
  int progress;
  String question;
  List<String> resources;
  Microtask({
    this.answer,
    this.detail,
    this.name,
    this.progress,
    this.question,
    this.resources,
  });
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

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'detail': detail,
      'name': name,
      'progress': progress,
      'question': question,
      'resources': resources,
    };
  }

  static Microtask fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Microtask(
      answer: map['answer'],
      detail: map['detail'],
      name: map['name'],
      progress: map['progress'],
      question: map['question'],
      resources: List<String>.from(map['resources']),
    );
  }
}
