import 'package:flutter/material.dart';
import 'package:forms/models/microtask.dart';
import 'package:forms/models/providers/initialValue.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:forms/screens/list_microtasks.dart';
import 'package:provider/provider.dart';

class MicrotaskScreen extends StatefulWidget {
  static const routeName = '/microtask';

  @override
  _MicrotaskScreenState createState() => _MicrotaskScreenState();
}

class _MicrotaskScreenState extends State<MicrotaskScreen> {
  bool isLoading = false;

  var micro = Microtask();
  final _answerController = TextEditingController();
  final _detailsController = TextEditingController();
  final _nameController = TextEditingController();
  final _questionController = TextEditingController();
  final _resourcesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _save(BuildContext context, String id) async {
    _formKey.currentState.save();
    setState(() {
      isLoading = true;
    });
    await Provider.of<MicroTaskProvider>(context, listen: false)
        .createMicrotask(micro, id);
  }

  Future<void> _update(BuildContext context, String id, String microId) async {
    Provider.of<InitialValue>(context, listen: false).reconfigure();
    _formKey.currentState.save();
    setState(() {
      isLoading = true;
    });
    await Provider.of<MicroTaskProvider>(context, listen: false)
        .updateMicrotask(id, microId, micro);
  }

  final Widget _verticalSpacer = SizedBox(
    height: 8.0,
  );
  @override
  Widget build(BuildContext context) {
    final String id = Provider.of<MissionProvider>(context, listen: false).id;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListMicrotasks(),
                  Consumer<InitialValue>(
                      builder: (BuildContext context, InitialValue value, _) {
                    //print(value.initValue['answer']);
                    return Card(
                      elevation: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: 500,
                        height: 450,
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            padding: const EdgeInsets.all(16),
                            children: <Widget>[
                              TextFormField(
                                controller: _answerController
                                  ..text = (value.initValue['answer']),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Answer"),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  micro = Microtask(
                                    answer: value,
                                    detail: micro.detail,
                                    name: micro.name,
                                    //progress: micro.progress,
                                    question: micro.question,
                                    resources: micro.resources,
                                  );
                                },
                              ),
                              _verticalSpacer,
                              TextFormField(
                                controller: _detailsController
                                  ..text = value.initValue['detail'],
                                //initialValue: value.initValue['detail'],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Details"),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  micro = Microtask(
                                    answer: micro.answer,
                                    detail: value,
                                    name: micro.name,
                                    //progress: micro.progress,
                                    question: micro.question,
                                    resources: micro.resources,
                                  );
                                },
                              ),
                              _verticalSpacer,
                              TextFormField(
                                controller: _nameController
                                  ..text = value.initValue['name'],
                                //initialValue: value.initValue['name'],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Name"),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  micro = Microtask(
                                    answer: micro.answer,
                                    detail: micro.detail,
                                    name: value,
                                    //progress: micro.progress,
                                    question: micro.question,
                                    resources: micro.resources,
                                  );
                                },
                              ),
                              _verticalSpacer,
                              TextFormField(
                                controller: _questionController
                                  ..text = value.initValue['question'],
                                //initialValue: value.initValue['question'],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Question"),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  micro = Microtask(
                                    answer: micro.answer,
                                    detail: micro.detail,
                                    name: micro.name,
                                    //progress: micro.progress,
                                    question: value,
                                    resources: micro.resources,
                                  );
                                },
                              ),
                              _verticalSpacer,
                              TextFormField(
                                controller: _resourcesController
                                  ..text = value.initValue['resources'],
                                //initialValue:value.initValue['resources'].toString(),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Resources"),
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
                                    //progress: micro.progress,
                                    question: micro.question,
                                    resources: lt,
                                  );
                                },
                              ),
                              _verticalSpacer,
                              value.initValue['name'] == ''
                                  ? Row(
                                      children: [
                                        FlatButton(
                                          color: Theme.of(context).accentColor,
                                          child: Text(
                                            "ADD Another microtask",
                                            style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () async {
                                            await _save(context, id);
                                            setState(() {
                                              isLoading = false;
                                            });
                                            //_formKey.currentState.reset();
                                          },
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        FlatButton(
                                          color: Theme.of(context).accentColor,
                                          child: Text(
                                            "DONE!!",
                                            style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () async {
                                            await _save(context, id);
                                            Navigator.of(context)
                                                .pushReplacementNamed('/');
                                          },
                                        )
                                      ],
                                    )
                                  : Center(
                                    child: FlatButton(
                                        color: Theme.of(context).accentColor,
                                        child: Text(
                                          "Update Microtask",
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () async {
                                          await _update(context, id,
                                              value.initValue['microId']);
                                          setState(() {
                                            isLoading = false;
                                          });
                                          //_formKey.currentState.reset();
                                        },
                                      ),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
