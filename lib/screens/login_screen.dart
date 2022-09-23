import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/signup_screen.dart';
import 'package:notes_app/services/authentication_services.dart';
import 'package:notes_app/utils/fd_textfield.dart';
import 'package:notes_app/utils/primary_button.dart';
import 'package:notes_app/utils/widgets_and_attributes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/login_logo.gif",
          height: 200,
        ),
        sizedBoxH40,
        const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
              fontWeight: FontWeight.bold),
        ),
        sizedBoxH10,
        const Text(
          "Please Enter your Email and Password",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        sizedBoxH30,
        FDTextField(
          controller: _emailTEC,
          labelText: "Your Email",
          height: 60,
        ),
        sizedBoxH20,
        FDTextField(
          controller: _passwordTEC,
          labelText: "Your Password",
          shouldHideText: true,
          height: 60,
        ),
        sizedBoxH20,
        PrimaryButton(
            text: "Login",
            onPressed: () {
              AuthenticationServices(FirebaseAuth.instance, context)
                  .logIn(email: _emailTEC.text, password: _passwordTEC.text);

              // FirebaseAuth.instance
              //     .signInWithEmailAndPassword(
              //         email: _emailTEC.text, password: _passwordTEC.text)
              //     .then((value) {
              //   Toast.info("Logged in");
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const HomeScreen()));
              // }).onError((error, stackTrace) {
              //   Toast.error();
              // });
            }),
        sizedBoxH30,
        const Text(
          "New User, Register",
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
        sizedBoxH8,
        InkWell(
          hoverColor: Colors.blue,
          highlightColor: Colors.green,
          child: const Text(
            "Click Here",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignupScreen()));
          },
        ),
      ],
    );
  }
}
