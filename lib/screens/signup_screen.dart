import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/global_widgets/background_widget.dart';
import 'package:notes_app/services/authentication_services.dart';
import 'package:notes_app/utils/fd_textfield.dart';
import 'package:notes_app/utils/primary_button.dart';
import 'package:notes_app/utils/widgets_and_attributes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundWidget(childScreen: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        "assets/images/signup_logo.gif",
        height: 180,
      ),
      sizedBoxH40,
      const Text(
        "Please Enter the following Details",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      sizedBoxH30,
      FDTextField(
        controller: _nameTEC,
        labelText: "Your Name",
        height: 60,
      ),
      FDTextField(
        controller: _emailTEC,
        labelText: "Your Email",
        height: 60,
      ),
      FDTextField(
        controller: _passwordTEC,
        labelText: "Your Password(6 digits)",
        shouldHideText: true,
        spacing: 2,
        height: 60,
      ),
      sizedBoxH20,
      PrimaryButton(
          text: "SignUp",
          onPressed: () {
            AuthenticationServices(FirebaseAuth.instance, context).signUp(
                email: _emailTEC.text,
                password: _passwordTEC.text,
                name: _nameTEC.text,
                timestamp: DateTime.now());

            // FirebaseAuth.instance
            //     .createUserWithEmailAndPassword(
            //         email: _emailTEC.text, password: _passwordTEC.text)
            //     .then((value) {
            //   Toast.info("Account Created");
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const HomeScreen()));
            // }).onError((error, stackTrace) {
            //   Toast.error();
            //   print(error.toString());
            // });
          }),
    ]);
  }
}
