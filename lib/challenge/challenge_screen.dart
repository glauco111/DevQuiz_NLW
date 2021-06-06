import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_screen.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengeScreen(
      {Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.bounceIn);
  }

  void onSelected(bool value) {
    if (value) {
      controller.scoreRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close)),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                )
              ],
            )),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: 'Pular',
                    onTap: nextPage,
                  )),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      scoreRight: controller.scoreRight,
                                      length: widget.questions.length,
                                      title: widget.title,
                                    )));
                      },
                      label: 'Confirmar',
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
