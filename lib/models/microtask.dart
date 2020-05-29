

import 'package:cloud_firestore/cloud_firestore.dart';

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
  Future<void> createMicrotask(Microtask microtask, String id) async {
    final db = Firestore.instance;
    await db
        .collection('missions')
        .document(id)
        .collection('Microtasks')
        .add(microtask.toMap());
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
