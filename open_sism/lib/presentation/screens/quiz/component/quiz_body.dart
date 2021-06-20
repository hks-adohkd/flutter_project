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

class _BodyState extends State<Body> with TickerProviderStateMixin {
  int numOfCorrectAns = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  AnimationController animationController;
  Animation animation;
  int pageIndex;
  int points;
  bool isAnswered = false;
  int correctAns;
  int electedAns;
  int selectedAns;
  RxInt questionNumber = 1.obs;
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

  void updateAnimation() {}
  void initControllerAnimation() {
    animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        // update like setState
        updateAnimation();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    //animationController.forward().whenComplete(nextQuestion);
    pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  }

  void checkAns({Question question, int selectedIndex, int length}) {
    // because once user press any option then it will run
    isAnswered = true;
    correctAns = question.answer;
    selectedAns = selectedIndex;

    if (correctAns == selectedAns) numOfCorrectAns++;

    // It will stop the counter
    animationController.stop();
    updateAnimation();

    // Once user select an ans after 3s it will go to the next qn
    // Future.delayed(Duration(seconds: 3), () {
    //   nextQuestion();
    // });
  }

  void nextQuestion() {
    if (questionNumber.value != 0) {
      isAnswered = false;
      pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      // Get.to(ScoreScreen());

    }
  }

  void updateTheQnNum(int index) {
    questionNumber.value = index + 1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    pageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initControllerAnimation();
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
    initControllerAnimation();
    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoadInProgress) {
          //show loading
        }
        if (state is QuizLoadedSuccess) {
          setState(() {
            pageController.animateToPage(state.userQuizIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });

          // Future.delayed(const Duration(milliseconds: 1000), () {
          //   // function spin init state
          //   context.read<QuizBloc>().add(QuizStableEvent());
          // });
        }
        if (state is QuizCheckAnswerSuccessful) {
          numOfCorrectAns++;
          animationController.stop();
          updateAnimation();

          // Once user select an ans after 3s it will go to the next qn
          // Future.delayed(Duration(seconds: 3), () {
          //   nextQuestion();
          // });
          // setState(() {
          //   pageController.animateToPage(state.userQuizIndex,
          //       duration: Duration(milliseconds: 500), curve: Curves.ease);
          // });
        }
        if (state is QuizCheckAnswerFailed) {
          animationController.stop();
          updateAnimation();
          // Once user select an ans after 3s it will go to the next qn
          // Future.delayed(Duration(seconds: 3), () {
          //   nextQuestion();
          // });
          // setState(() {
          //   pageController.animateToPage(state.userQuizIndex,
          //       duration: Duration(milliseconds: 500), curve: Curves.ease);
          // });
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
                      } else if (state is QuizCheckAnswerSuccessful) {
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
                      } else if (state is QuizCheckAnswerFailed) {
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
                        return buildPageView(state);
                      }
                      if (state is QuizLoadedSuccess) {
                        return buildPageView(state);
                      } else if (state is QuizCheckAnswerSuccessful) {
                        return buildPageView(state);
                      } else if (state is QuizCheckAnswerFailed) {
                        return buildPageView(state);
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

  PageView buildPageView(QuizState state) {
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
    } else
      return PageView.builder(
        // Block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        //onPageChanged: _questionController.updateTheQnNum,
        onPageChanged: (index) {
          pageChanged(index);
        },
        //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
        itemCount: state is QuizLoadedSuccess
            ? state.quizData.totalQuestions
            : state is QuizCheckAnswerSuccessful
                ? state.quizData.totalQuestions
                : 1,
        itemBuilder: (context, index) => state is QuizLoadedSuccess
            ? QuestionCard(question: state.questionData[index])
            : state is QuizCheckAnswerFailed
                ? QuestionCard(question: state.questionData[index])
                : state is QuizCheckAnswerSuccessful
                    ? QuestionCard(question: state.questionData[index])
                    : QuestionCard(
                        question: Question(
                            id: 0,
                            question: " ",
                            options: [
                              Options(
                                  question: " ",
                                  id: 0,
                                  itemOrder: 1,
                                  isRightOption: false)
                            ],
                            answer: 0)),
      );
    // if (state is QuizLoadedSuccess) {
    //   return PageView.builder(
    //     // Block swipe to next qn
    //     physics: NeverScrollableScrollPhysics(),
    //     controller: pageController,
    //     //onPageChanged: _questionController.updateTheQnNum,
    //     onPageChanged: (index) {
    //       pageChanged(index);
    //     },
    //     //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
    //     itemCount: state.quizData.totalQuestions,
    //     itemBuilder: (context, index) =>
    //         QuestionCard(question: state.questionData[index]),
    //   );
    // }
    // if (state is QuizStableState) {
    //   return PageView.builder(
    //     // Block swipe to next qn
    //     physics: NeverScrollableScrollPhysics(),
    //     controller: pageController,
    //     //onPageChanged: _questionController.updateTheQnNum,
    //     //controller: PageController(initialPage: mSelectedPosition, keepPage: true, viewportFraction: 1),
    //     itemCount: state.quizData.totalQuestions,
    //     itemBuilder: (context, index) =>
    //         QuestionCard(question: state.questionData[index], press: checkAns),
    //   );
    // }
  }
}
