import 'package:flutter/material.dart';
import 'package:notes_app/helper/appcolors.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final bool isLoading;
  final Widget? child;
  final double fontSize;
  final double elevation;
  const PrimaryButton({
    Key? key,
    this.color = AppColors.primary,
    required this.onPressed,
    this.text = "",
    this.height = 50,
    this.isLoading = false,
    this.width,
    this.child,
    this.fontSize = 16,
    this.elevation = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: onPressed != null ? color : color.withOpacity(0.6),
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w700),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        elevation: elevation,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: isLoading ? null : onPressed,
          child: Align(
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : child ?? Text(text),
          ),
        ),
      ),
    );
  }
}
