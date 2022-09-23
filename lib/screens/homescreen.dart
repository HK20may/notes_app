import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/utils/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Logout"),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Toast.normal("Logged Out Successfully");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const MyApp()));
          }).onError((error, stackTrace) {
            Toast.error("Something went wrong, Tryagain!!");
          });
        },
      )),
    );
  }
}
