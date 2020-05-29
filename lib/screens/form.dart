import 'package:flutter/material.dart';
import 'dart:core';

import 'package:forms/models/mission.dart';

import 'microtasks.dart';

class FormScreen extends StatelessWidget {
  var mission = Missions();
  final _formKey = GlobalKey<FormState>();
  Future<void> _save() async {
    _formKey.currentState.save();
    await mission.createMission(mission);
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 700,
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "CompanyID"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                    companyId: value,
                    img: mission.img,
                    difficulty: mission.difficulty,
                    microtasksNos: mission.microtasksNos,
                    name: mission.name,
                    tags: mission.tags,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "CoverImage"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                    companyId: mission.companyId,
                    img: value,
                    difficulty: mission.difficulty,
                    microtasksNos: mission.microtasksNos,
                    name: mission.name,
                    tags: mission.tags,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "difficulty"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                    companyId: mission.companyId,
                    img: mission.img,
                    difficulty: value,
                    microtasksNos: mission.microtasksNos,
                    name: mission.name,
                    tags: mission.tags,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "No of Microtasks"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                    companyId: mission.companyId,
                    img: mission.img,
                    difficulty: mission.difficulty,
                    microtasksNos: int.parse(value),
                    name: mission.name,
                    tags: mission.tags,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                    companyId: mission.companyId,
                    img: mission.img,
                    difficulty: mission.difficulty,
                    microtasksNos: mission.microtasksNos,
                    name: value,
                    tags: mission.tags,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "tags"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  var lt = new List<String>();
                  final _delimiter = ',';
                  final _values = value.split(_delimiter);
                  //print(_values);
                  _values.forEach((item) {
                    lt.add(item);
                  });
                  mission = Missions(
                    companyId: mission.companyId,
                    img: mission.img,
                    difficulty: mission.difficulty,
                    microtasksNos: mission.microtasksNos,
                    name: mission.name,
                    tags: lt,
                    details: mission.details,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Details Of Mission"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (value) {
                  mission = Missions(
                    companyId: mission.companyId,
                    img: mission.img,
                    difficulty: mission.difficulty,
                    microtasksNos: mission.microtasksNos,
                    name: mission.name,
                    tags: mission.tags,
                    details: value,
                  );
                },
              ),
              // RaisedButton(
              //   onPressed: () => _save(),
              // ),
              RaisedButton(
                onPressed: () async {
                  await _save();
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          width: 800,
                          height: 800,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Microtasks(mission.missionId),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Create Mission AND add microtask'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
