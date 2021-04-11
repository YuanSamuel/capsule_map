import 'package:capsule_map/screens/root_screen.dart';
import 'package:capsule_map/screens/signin_screen.dart';
import 'package:capsule_map/screens/welcome_screen.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MainStore>(
          create: (_) => MainStore()..setupReactions(),
        ),
        Provider<PositionStore>(
            create: (_) => PositionStore()..checkPermissions()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
