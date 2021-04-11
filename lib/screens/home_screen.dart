import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PositionStore positionStore = Provider.of<PositionStore>(context);

    return Observer(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(positionStore.positionStream != null
              ? positionStore.positionStream.value.toString()
              : 'Permission Disabled'),
        ),
      );
    });
  }
}
