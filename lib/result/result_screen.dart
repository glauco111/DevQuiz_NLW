import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  final String title;
  final int length;
  final int scoreRight;
  const ResultScreen(
      {Key? key,
      required this.title,
      required this.length,
      required this.scoreRight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Parabéns',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu:',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: '\n$title', style: AppTextStyles.bodyBold),
                      TextSpan(
                          text: '\ncom $scoreRight de $length acertos! ',
                          style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                              'DevQuiz NLW 5 - Flutter\n Resultado do Quiz: $title \n Obtive a nota: ${scoreRight / length}% de aproveitamento!',
                            );
                          }),
                    )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: NextButtonWidget.white(
                            label: 'Voltar ao inicio',
                            onTap: () => Navigator.pop(context)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
