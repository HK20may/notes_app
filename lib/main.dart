import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/global_widgets/background_widget.dart';
import 'package:notes_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
    builder: BotToastInit(),
    navigatorObservers: [BotToastNavigatorObserver()],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: BackgroundWidget(
          childScreen: LoginScreen(),
        ),
      ),
    );
  }
}
