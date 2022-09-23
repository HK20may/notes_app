import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? childScreen;
  const BackgroundWidget({required this.childScreen, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(4, 4, 104, 1),
              Color.fromRGBO(20, 16, 170, 1),
              Color.fromRGBO(4, 2, 104, 1),
            ]),
      ),
      child: childScreen,
    );
  }
}
