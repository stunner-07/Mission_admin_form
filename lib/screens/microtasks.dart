import 'package:flutter/material.dart';
import 'package:forms/models/microtask.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class MicrotaskScreen extends StatefulWidget {
  static const routeName = '/microtask';

  @override
  _MicrotaskScreenState createState() => _MicrotaskScreenState();
}

class _MicrotaskScreenState extends State<MicrotaskScreen> {
  bool isLoading = false;

  var micro = Microtask();

  final _formKey = GlobalKey<FormState>();

  Future<void> _save(BuildContext context, String id) async {
    _formKey.currentState.save();
    setState(() {
      isLoading = true;
    });
    await Provider.of<MicroTaskProvider>(context, listen: false)
        .createMicrotask(micro, id);
    // setState(() {
    //   isLoading = false;
    // });
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
              child: Card(
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Name"),
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
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: "Progress"),
                        //   textInputAction: TextInputAction.next,
                        //   onSaved: (value) {
                        //     micro = Microtask(
                        //       answer: micro.answer,
                        //       detail: micro.detail,
                        //       name: micro.name,
                        //       //progress: int.parse(value),
                        //       question: micro.question,
                        //       resources: micro.resources,
                        //     );
                        //   },
                        // ),
                        // _verticalSpacer,
                        TextFormField(
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
                        Row(
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
                                Navigator.of(context).pushReplacementNamed('/');
                              },
                            )
                          ],
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
