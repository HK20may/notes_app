import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/utils/primary_button.dart';
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
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const Text(
            "Note It Right",
          ),
          centerTitle: true,
          actions: [
            InkWell(
                child: Image.asset("assets/images/logout_icon.gif"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _showLogoutWidget();
                    },
                  );
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Image.asset(
              "assets/images/pencil_icon.gif",
              height: 200,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (contect) => const AddNote()));
            }),
        body: Container());
  }

  Widget _showLogoutWidget() {
    return AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are You Sure You Want To Logout"),
      actions: [
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Toast.normal("Logged Out Successfully");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MyApp()));
            }).onError((error, stackTrace) {
              Toast.error("Something went wrong, Tryagain!!");
            });
          },
        )
      ],
    );
  }
}
