import 'package:Al_Zab_township_guide/view/Size/SizedApp.dart';
import 'package:Al_Zab_township_guide/view/ThemeApp/app_theme.dart';
import 'package:flutter/material.dart';
import '../ThemeApp/ColorUsed.dart';

// ignore: must_be_immutable
class ButtonSelect extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  ButtonSelect({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          minimumSize: const Size(28.0, 24.0),
          maximumSize: const Size(400, 200),
          fixedSize: const Size(0.0, 55.0),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
              // Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          backgroundColor: ColorUsed.primary,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppTheme.notWhite,
            fontSize: setFontSize(16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    minimumSize: const Size(28.0, 24.0),
    maximumSize: const Size(400, 200),
    fixedSize: const Size(0.0, 55.0),
    padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
        // Theme.of(context).colorScheme.inversePrimary
      ),
    ),
  );
}
