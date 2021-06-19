import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/quiz/controllers/quiz_question_controller.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';
import 'package:flutter_svg/svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _numOfCorrectAns = 0;
  QuestionController questionController = QuestionController();
  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  int pageIndex;
  int points;

  void pageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      pageIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    // AnimationController animationController;
    // Animation animation;
    // PageController pageController;
    // bool isAnswered = false;
    // int correctAns;
    // int _electedAns;
    // RxInt questionNumber = 1.obs;

    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoadInProgress) {
          //show loading
        }
        if (state is QuizLoadedSuccess) {
          // setState(() {
          //   pageController.animateToPage(state.userQuizIndex,
          //       duration: Duration(milliseconds: 500), curve: Curves.ease);
          // });

          Future.delayed(const Duration(milliseconds: 1000), () {
            // function spin init state
            context.read<QuizBloc>().add(QuizStableEvent());
          });
        }
        if (state is QuizStableState) {
          setState(() {
            pageController.animateToPage(state.userQuizIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        }
      },
      child: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: Stack(
          children: [
            //  SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  //   child: ProgressBar(),
                  // ),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: BlocBuilder<QuizBloc, QuizState>(
                        builder: (context, state) {
                      if (state is QuizLoadedSuccess) {
                        return Text.rich(
                          TextSpan(
                            text: "Question ${state.userQuizIndex + 1}",
                            // "Question ${_questionController.questionNumber.value}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text: "/${state.quizData.totalQuestions}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        );
                      } else
                        return Text(" ");
                    }),
                  ),
                  Divider(thickness: 2),
                  //SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: BlocBuilder<QuizBloc, QuizState>(
                        builder: (context, state) {
                      if (state is QuizLoadInProgress) {
                        return buildPageView(questionController, state);
                      }
                      if (state is QuizLoadedSuccess) {
                        return buildPageView(questionController, state);
                      } else if (state is QuizStableState) {
                        return buildPageView(questionController, state);
                      } else
                        return Text("");
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PageView buildPageView(
      QuestionController questionController, QuizState state) {
    if (state is QuizLoadInProgress) {
      return PageView.builder(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
        itemCount: 1,
        itemBuilder: (context, index) => QuestionCard(
            question: Question(
                id: 0,
                question: " ",
                options: [
                  Options(
                      question: " ", id: 0, itemOrder: 1, isRightOption: false)
                ],
                answer: 0)),
      );
    }
    if (state is QuizLoadedSuccess) {
      return PageView.builder(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        //onPageChanged: _questionController.updateTheQnNum,
        onPageChanged: (index) {
          pageChanged(index);
        },
        //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
        itemCount: state.quizData.totalQuestions,
        itemBuilder: (context, index) =>
            QuestionCard(question: state.questionData[index]),
      );
    }
    if (state is QuizStableState) {
      return PageView.builder(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        //onPageChanged: _questionController.updateTheQnNum,
        //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
        itemCount: state.quizData.totalQuestions,
        itemBuilder: (context, index) =>
            QuestionCard(question: state.questionData[index]),
      );
    }
  }
}
