enum Difficulty{
  Beginner,
  Intermediate,
  Advanced,
}
class Missions {
  String missionId;
  String companyId;
  String coverImg;
  Difficulty difficulty;
  int microtasksNos;
  String name;
  List<String> tags;
  String details;
  Missions({
    this.missionId,
    this.companyId,
    this.coverImg,
    this.difficulty,
    this.microtasksNos,
    this.name,
    this.tags,
    this.details,
  });
  String get levelDiff{
  if(difficulty==Difficulty.Beginner){
    return 'l1';
  }
  else if(difficulty==Difficulty.Intermediate){
    return 'l2';
  }
  else{
    return 'l3';
  }
}
  Map<String, dynamic> toMap() {
    return {
      //'missionId': missionId,
      'companyId': companyId,
      'coverImg': coverImg,
      'difficulty': levelDiff,
      'microtasksNos': microtasksNos,
      'name': name,
      'tags': tags,
      //'details': details,
    };
  }

  // static Missions fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;

  //   return Missions(
  //     //missionId: map['missionId'],
  //     companyId: map['companyId'],
  //     coverImg: map['coverImg'],
  //     difficulty: map['difficulty'],
  //     microtasksNos: map['microtasksNos'],
  //     name: map['name'],
  //     tags: List<String>.from(map['tags']),
  //     details: map['details'],
  //   );
  // }
}
