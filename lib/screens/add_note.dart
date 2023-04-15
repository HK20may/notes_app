import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/toast.dart';
import 'package:notes_app/utils/widgets_and_attributes.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String _titleNote;
  late String _bodyNote;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                        onPressed: addDataToCloud,
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
                sizedBoxH20,
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration.collapsed(
                          hintText: "Title",
                          hintStyle: TextStyle(
                            color: Colors.white60,
                          )),
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue[400],
                          fontWeight: FontWeight.w700),
                      onChanged: (_val) {
                        _titleNote = _val;
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                            hintText: "Note",
                            hintStyle: TextStyle(color: Colors.white60)),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        onChanged: (_val) {
                          _bodyNote = _val;
                        },
                        maxLines: 20,
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    ));
  }

  void addDataToCloud() async {
    try {
      CollectionReference dataRef = FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("notes");

      var data = {
        'title': _titleNote,
        'desc': _bodyNote,
        'createdAt': DateTime.now()
      };

      dataRef.add(data);
      Navigator.of(context).pop();
      Toast.info("Note Saved Success");
    } catch (e) {
      Toast.error(e.toString());
    }
  }
}
