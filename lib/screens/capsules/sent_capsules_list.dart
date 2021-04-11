import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/screens/capsules/capsule_widget.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SentCapsulesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      MainStore mainStore = Provider.of<MainStore>(context);

      List<Capsule> capsules = mainStore.capsulesStore.capsules;

      return ListView.builder(
        itemCount: capsules != null ? capsules.length : 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Theme(
                data: ThemeData(
                  canvasColor: Colors.transparent,
                ),
                child: CapsuleWidget(capsule: capsules[index], color: Color(0xFF58A2E4),)),
          );
        },
      );
    });
  }
}
