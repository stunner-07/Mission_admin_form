import 'package:flutter/material.dart';
import 'package:forms/Widgets/mirotask_item.dart';
import 'package:forms/models/providers/microtask_provider.dart';
import 'package:forms/models/providers/mission_provider.dart';
import 'package:provider/provider.dart';

class ListMicrotasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = Provider.of<MissionProvider>(context, listen: false).id;
    var micro = Provider.of<MicroTaskProvider>(context);
    return Card(
      elevation: 10,
      child: Container(
        width: 500,
        height: 500,
        child: FutureBuilder(
          future: micro.fetchMicrotask(id),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (_, i) {
                        return Column(
                          children: <Widget>[
                            MicrotaskItem(micro.microList[i].name),
                            Divider(),
                          ],
                        );
                      },
                      itemCount: micro.microList.length,
                    ),
        ),
      ),
    );
  }
}
