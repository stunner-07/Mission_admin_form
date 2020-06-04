import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:forms/models/mission.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

import 'microtasks.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var mission = Missions();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> _save(BuildContext context) async {
    _formKey.currentState.save();
    setState(() {
      isLoading = true;
      //_formKey.currentState.reset();
    });
    await Provider.of<MissionProvider>(context, listen: false)
        .createMission(mission);

    // setState(() {
    //   isLoading = false;
    // });
    Navigator.of(context).pushNamed(MicrotaskScreen.routeName);
  }

  var _level = Difficulty.Beginner;

  // String get levelDiff{
  // if(_level==Difficulty.Beginner){
  //   return 'l1';
  // }
  // else if(_level==Difficulty.Intermediate){
  //   return 'l2';
  // }
  // else if(_level==Difficulty.Advanced){
  //   return 'l3';
  // }
  // else
  // return '';
  // }

  final Widget _verticalSpacer = SizedBox(
    height: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Card(
                elevation: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 500,
                  height: 600,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "CompanyID"),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: value,
                              coverImg: mission.coverImg,
                              difficulty: mission.difficulty,
                              microtasksNos: mission.microtasksNos,
                              name: mission.name,
                              tags: mission.tags,
                              details: mission.details,
                            );
                          },
                        ),
                        _verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "CoverImage"),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: mission.companyId,
                              coverImg: value,
                              difficulty: mission.difficulty,
                              microtasksNos: mission.microtasksNos,
                              name: mission.name,
                              tags: mission.tags,
                              details: mission.details,
                            );
                          },
                        ),
                        _verticalSpacer,
                        DropdownButtonFormField<Difficulty>(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Difficulty',
                              hintText: 'Please choose one'),
                          value: _level,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: mission.companyId,
                              coverImg: mission.coverImg,
                              difficulty: value,
                              microtasksNos: mission.microtasksNos,
                              name: mission.name,
                              tags: mission.tags,
                              details: mission.details,
                            );
                            setState(() {
                              _level = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _level = value;
                            });
                          },
                          items: <String>[
                            "Beginner",
                            "Intermediate",
                            "Advanced"
                          ].map<DropdownMenuItem<Difficulty>>((String value) {
                            return DropdownMenuItem<Difficulty>(
                              value: value == "Beginner"
                                  ? Difficulty.Beginner
                                  : value == "Intermediate"
                                      ? Difficulty.Intermediate
                                      : Difficulty.Advanced,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        _verticalSpacer,
                        // TextFormField(
                        //   decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Difficulty"),
                        //   textInputAction: TextInputAction.next,
                        //   onSaved: (value) {
                        //     mission = Missions(
                        //       companyId: mission.companyId,
                        //       coverImg: mission.coverImg,
                        //       difficulty: value,
                        //       microtasksNos: mission.microtasksNos,
                        //       name: mission.name,
                        //       tags: mission.tags,
                        //       details: mission.details,
                        //     );
                        //   },
                        // ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "No of Microtasks"),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: mission.companyId,
                              coverImg: mission.coverImg,
                              difficulty: mission.difficulty,
                              microtasksNos: int.parse(value),
                              name: mission.name,
                              tags: mission.tags,
                              details: mission.details,
                            );
                          },
                        ),
                        _verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Name"),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: mission.companyId,
                              coverImg: mission.coverImg,
                              difficulty: mission.difficulty,
                              microtasksNos: mission.microtasksNos,
                              name: value,
                              tags: mission.tags,
                              details: mission.details,
                            );
                          },
                        ),
                        _verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Tags"),
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
                              coverImg: mission.coverImg,
                              difficulty: mission.difficulty,
                              microtasksNos: mission.microtasksNos,
                              name: mission.name,
                              tags: lt,
                              details: mission.details,
                            );
                          },
                        ),
                        _verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Details Of Mission"),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          onSaved: (value) {
                            mission = Missions(
                              companyId: mission.companyId,
                              coverImg: mission.coverImg,
                              difficulty: mission.difficulty,
                              microtasksNos: mission.microtasksNos,
                              name: mission.name,
                              tags: mission.tags,
                              details: value,
                            );
                          },
                        ),
                        _verticalSpacer,
                        // RaisedButton(
                        //   onPressed: () => _save(),
                        // ),
                        FlatButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () async {
                            await _save(context);
                            // return showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return Dialog(
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(20.0)),
                            //       child: Container(
                            //         width: 800,
                            //         height: 800,
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(12.0),
                            //           child: MicrotaskScreen(mission.missionId),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                          child: Text(
                            'Create Mission and Add Microtask',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
