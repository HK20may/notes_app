import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/widgets_and_attributes.dart';

class Toast {
  static void normal(String msg, {Alignment align = const Alignment(0, 0.85)}) {
    _buildCustomToast(msg, Colors.black87, align: align);
  }

  static void info(String msg, {Alignment align = const Alignment(0, 0.85)}) {
    _buildCustomToast(msg, Colors.black87, align: align);
  }

  static void error([String errorMsg = "Oops! Try Again."]) {
    _buildCustomToast(errorMsg, Colors.black87, isErrorType: true);
  }

  static void _buildCustomToast(String msg, Color bgColor,
      {Alignment align = const Alignment(0, 0.85), bool isErrorType = false}) {
    BotToast.showCustomText(
      onlyOne: true,
      duration: Duration(seconds: _getToastDuration(msg)),
      align: align,
      ignoreContentClick: true,
      toastBuilder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColor,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, spreadRadius: 4, color: Colors.black26)
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/error_icon.gif",
                  height: 40,
                  color: isErrorType
                      ? const Color(0xFFF33636)
                      : const Color(0xFF8ADB7D),
                ),
                sizedBoxW10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isErrorType ? 'Error' : 'Info',
                        style: TextStyle(
                            fontSize: 15,
                            color: isErrorType
                                ? const Color(0xFFF33636)
                                : const Color(0xFF8ADB7D),
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        msg,
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xFF9B9B9B)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static int _getToastDuration(String msg) {
    int toastDuration = msg.length ~/ 20;

    if (toastDuration < 2) {
      toastDuration = 2;
    } else if (toastDuration > 8) {
      toastDuration = 8;
    }
    return toastDuration;
  }
}
