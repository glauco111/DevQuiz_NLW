import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 15),
      height: 70,
      width: 70,
      child: Stack(
        children: [
          Container(
            height: 70,
            width: 70,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: 0.75,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
          Center(
              child: Text(
            '75%',
            style: AppTextStyles.heading,
          ))
        ],
      ),
    );
  }
}
