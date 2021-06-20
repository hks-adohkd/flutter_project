import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';
import 'package:open_sism/presentation/screens/quiz/controllers/question_controller.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'quiz_option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    //QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index].question,
              press: () {
                context.read<QuizBloc>().add(QuizCheckAnswer(
                    answerIndex: question.answer, userAnswerIndex: index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
