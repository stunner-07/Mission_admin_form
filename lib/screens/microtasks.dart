import 'package:flutter/material.dart';
import 'package:forms/models/microtask.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class MicrotaskScreen extends StatelessWidget {
  static const routeName = '/microtask';
  //MicrotaskScreen(this.id);
  var micro = Microtask();
  final _formKey = GlobalKey<FormState>();
  Future<void> _save(BuildContext context,String id) async {
      _formKey.currentState.save();
    await Provider.of<MicroTaskProvider>(context,listen: false).createMicrotask(micro, id);
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    final String id=Provider.of<MissionProvider>(context,listen: false).id;
    return Scaffold(
      body: Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "answer"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  micro = Microtask(
                    answer: value,
                    detail: micro.detail,
                    name: micro.name,
                    progress: micro.progress,
                    question: micro.question,
                    resources: micro.resources,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "details"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  micro = Microtask(
                    answer: micro.answer,
                    detail: value,
                    name: micro.name,
                    progress: micro.progress,
                    question: micro.question,
                    resources: micro.resources,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "name"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  micro = Microtask(
                    answer: micro.answer,
                    detail: micro.detail,
                    name: value,
                    progress: micro.progress,
                    question: micro.question,
                    resources: micro.resources,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "progress"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  micro = Microtask(
                    answer: micro.answer,
                    detail: micro.detail,
                    name: micro.name,
                    progress: int.parse(value),
                    question: micro.question,
                    resources: micro.resources,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  micro = Microtask(
                    answer: micro.answer,
                    detail: micro.detail,
                    name: micro.name,
                    progress: micro.progress,
                    question: value,
                    resources: micro.resources,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "resources"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  var lt = new List<String>();
                  final _delimiter = ',';
                  final _values = value.split(_delimiter);
                  //print(_values);
                  _values.forEach((item) {
                    lt.add(item);
                  });
                  micro = Microtask(
                    answer: micro.answer,
                    detail: micro.detail,
                    name: micro.name,
                    progress: micro.progress,
                    question: micro.question,
                    resources: lt,
                  );
                },
              ),
              Row(
                children: [
                  RaisedButton(
                    child: Text("ADD Another microtask"),
                    onPressed: () async => await _save(context,id),
                  ),
                  SizedBox(width: 20,),
                  RaisedButton(
                    child: Text("DONE!!"),
                    onPressed: () async {
                      await _save(context,id);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
