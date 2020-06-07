import 'package:flutter/material.dart';
import 'package:forms/models/microtask.dart';

class InitialValue with ChangeNotifier {
  var initValue = {
    'answer': '',
    'detail': '',
    'name': '',
    'question': '',
    'resources': '',
    'microId': '',
  };
  void configureInitialValues(Microtask micro) {
    initValue = {
      'answer': micro.answer,
      'detail': micro.detail,
      'name': micro.name,
      'question': micro.question,
      'resources': micro.resources.join(','),
      'microId': micro.microtaskId,
    };
    notifyListeners();
  }

  void reconfigure() {
    initValue = {
      'answer': '',
      'detail': '',
      'name': '',
      'question': '',
      'resources': '',
      'microId': '',
    };
    notifyListeners();
  }
}
