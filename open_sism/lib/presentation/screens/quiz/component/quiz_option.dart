import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_sism/presentation/screens/quiz/controllers/question_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';

import 'package:open_sism/presentation/configurations/constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Color getTheRightColor(QuizState state) {
      if (state is QuizCheckAnswerSuccessful) {
        print("green");
        return kGreenColor;
      } else if (state is QuizCheckAnswerFailed) {
        print("red");
        return kRedColor;
      }
      print("kGrayColor");
      return kGrayColor;
    }

    IconData getTheRightIcon(QuizState state) {
      return getTheRightColor(state) == kRedColor ? Icons.close : Icons.done;
    }

    return BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      return InkWell(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor(state)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1}. $text",
                style: TextStyle(color: getTheRightColor(state), fontSize: 16),
              ),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: getTheRightColor(state) == kGrayColor
                      ? Colors.transparent
                      : getTheRightColor(state),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getTheRightColor(state)),
                ),
                child: getTheRightColor(state) == kGrayColor
                    ? null
                    : Icon(getTheRightIcon(state), size: 16),
              )
            ],
          ),
        ),
      );
    });
  }
}
