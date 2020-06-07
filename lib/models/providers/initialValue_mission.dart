import 'package:flutter/material.dart';
import 'package:forms/models/mission.dart';

class MissionInitialValue with ChangeNotifier {
  var initValue ={
      'companyId': '',
      'coverImg': '',
      'difficulty': Difficulty.Beginner,
      'name': '',
      'tags': '',
      'details': '',
      'missionId':'',
    };
  void configureInitialValues(Missions m) {
    initValue ={
      'companyId': m.companyId,
      'coverImg': m.coverImg,
      'difficulty': m.difficulty,
      'name': m.name,
      'tags':  m.tags.join(','),
      'details': m.details,
      'missionId':m.missionId,
    };
    notifyListeners();
  }

  void reconfigure() {
    initValue = {
      'companyId': '',
      'coverImg': '',
      'difficulty': Difficulty.Beginner,
      'name': '',
      'tags': '',
      'details': '',
      'missionId':'',
    };
    notifyListeners();
  }
}
