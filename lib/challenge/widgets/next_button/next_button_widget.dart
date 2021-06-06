import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;
  NextButtonWidget(
      {required this.label,
      required this.overlayColor,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap,
      required this.borderColor});

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.textColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.overlayColor = Colors.green.withAlpha(50),
        this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.textColor = AppColors.grey,
        this.onTap = onTap,
        this.overlayColor = AppColors.lightGreen,
        this.borderColor = AppColors.border,
        this.label = label;
  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.textColor = AppColors.white,
        this.onTap = onTap,
        this.overlayColor = AppColors.purple,
        this.borderColor = AppColors.border,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateColor.resolveWith((states) => overlayColor),
              side: MaterialStateProperty.all(BorderSide(color: borderColor)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
            ),
            onPressed: onTap,
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600, fontSize: 15, color: textColor),
            )));
  }
}
