class Microtask {
  String answer;
  String detail;
  String name;
  String microtaskId;
  String question;
  List<String> resources;
  Microtask({
    this.answer,
    this.detail,
    this.name,
    this.microtaskId,
    this.question,
    this.resources,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'detail': detail,
      'name': name,
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
      question: map['question'],
      resources: List<String>.from(map['resources']),
      microtaskId: map['microtaskId'],
    );
  }
}
