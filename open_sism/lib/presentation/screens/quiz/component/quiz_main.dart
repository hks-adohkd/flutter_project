import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';

class QuizScreen extends HookWidget {
  static const String routeName = "/quiz_main";
  void updateAnimation() {}
  @override
  Widget build(BuildContext context) {
    //final quizQuestions = useProvider(quizQuestionsProvider);
    final pageController = usePageController();
    final animationController = useAnimationController();
    final animation = useAnimation(
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            // update like setState
            updateAnimation();
          }));
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // Fluttter show the back button automatically
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.pause,
              ),
              label: Text('Pause'),
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizLoadFailure) {
              return QuizError(
                  message: state is QuizLoadFailure
                      ? state.quizStoredData.message
                      : "Problem in Loading Data");
            } else if (state is QuizLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            } else
              return _buildBody(context, pageController, animationController,
                  animation, updateAnimation);
          },
        ),
        bottomSheet:
            BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
          if (state is QuizCheckAnswerSuccessful) {
            //return const SizedBox.shrink();
            return CustomButton(
              title: pageController.page.toInt() + 1 <
                      state.quizData.totalQuestions
                  ? 'Next Question'
                  : 'See Results',
              onTap: () {
                //add event Load Success with next question
                // context
                //     .read(quizControllerProvider)
                //     .nextQuestion(questions, pageController.page.toInt());

                if (pageController.page.toInt() + 1 <
                    state.quizData.totalQuestions) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                  context.read<QuizBloc>().add(QuizStableEvent());
                } else {
                  context.read<QuizBloc>().add(QuizCompleteEvent());
                }
              },
            );
          } else if (state is QuizCheckAnswerFailed) {
            //return const SizedBox.shrink();
            return CustomButton(
              title: pageController.page.toInt() + 1 <
                      state.quizData.totalQuestions
                  ? 'Next Question'
                  : 'Finish',
              onTap: () {
                //add event Load Success with next question
                // context
                //     .read(quizControllerProvider)
                //     .nextQuestion(questions, pageController.page.toInt());

                if (pageController.page.toInt() + 1 <
                    state.quizData.totalQuestions) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                  context.read<QuizBloc>().add(QuizStableEvent());
                } else {
                  context.read<QuizBloc>().add(QuizCompleteEvent());
                }
              },
            );
          } else
            return const SizedBox.shrink();
        }),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PageController pageController,
    AnimationController animationC,
    double animation,
    Function press,
  ) {
    // if (questions.isEmpty) return QuizError(message: 'No questions found.');

    //final quizState = useProvider(quizControllerProvider.state);
    return BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      if (state is QuizCompleteState) {
        return QuizResults(state: state, questions: state.questionData);
      } else
        return QuizQuestions(
          pageController: pageController,
          animation: animation,
          animationController: animationC,
          press: press,
          questions: state is QuizLoadedSuccess
              ? state.questionData
              : state is QuizStableState
                  ? state.questionData
                  : state is QuizCheckAnswerSuccessful
                      ? state.questionData
                      : state is QuizCheckAnswerFailed
                          ? state.questionData
                          : [],
          total: state is QuizLoadedSuccess
              ? state.quizData.totalQuestions
              : state is QuizStableState
                  ? state.quizData.totalQuestions
                  : state is QuizCheckAnswerSuccessful
                      ? state.quizData.totalQuestions
                      : state is QuizCheckAnswerFailed
                          ? state.quizData.totalQuestions
                          : 0,
        );
    });
  }
}

class QuizError extends StatelessWidget {
  final String message;

  const QuizError({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            title: 'Retry',
            onTap: () => context.read<QuizBloc>().add(QuizDataRequested()),
          ),
        ],
      ),
    );
  }
}

final List<BoxShadow> boxShadow = const [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 2),
    blurRadius: 4.0,
  ),
];

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(25.0),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class QuizResults extends StatelessWidget {
  final QuizState state;
  final List<Question> questions;

  const QuizResults({
    Key key,
    @required this.state,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "your result",
          // "${state.correct.length} / ${questions.length}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          title: 'Finish',
          onTap: () {
            // context.refresh(quizRepositoryProvider);
            // context.read(quizControllerProvider).reset();
          },
        ),
      ],
    );
  }
}

class QuizQuestions extends StatelessWidget {
  final PageController pageController;
  final QuizState state;
  final List<Question> questions;
  final int total;
  final AnimationController animationController;
  final double animation;
  final Function press;
  const QuizQuestions(
      {Key key,
      this.state,
      @required this.pageController,
      @required this.questions,
      this.total,
      this.animationController,
      this.animation,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    print(total);
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(
              pageController: pageController,
              state: state,
              total: total,
              animationController: animationController,
              animation: animation,
              press: press,
            ),
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                question.question,
                // HtmlCharacterEntities.decode(question.question),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Column(
              children: question.options
                  .map((e) => BlocBuilder<QuizBloc, QuizState>(
                          builder: (context, state) {
                        if (state is QuizCheckAnswerSuccessful) {
                          print(
                              {"userIndexSelection", state.userIndexSelection});
                          return AnswerCard(
                              answer: e.question,
                              isSelected:
                                  e.itemOrder == state.userIndexSelection,
                              isCorrect: (question.answer + 1) == e.itemOrder,
                              isDisplayingAnswer: true,
                              onTap: () {
                                // context.read<QuizBloc>().add(QuizCheckAnswer(
                                //     answerIndex: question.answer,
                                //     userAnswerIndex: e.itemOrder));
                              });
                        } else if (state is QuizCheckAnswerFailed) {
                          print(
                              {"userIndexSelection", state.userIndexSelection});
                          return AnswerCard(
                              answer: e.question,
                              isSelected:
                                  e.itemOrder == state.userIndexSelection,
                              isCorrect: (question.answer + 1) == e.itemOrder,
                              isDisplayingAnswer: true,
                              onTap: () {
                                // context.read<QuizBloc>().add(QuizCheckAnswer(
                                //     answerIndex: question.answer,
                                //     userAnswerIndex: e.itemOrder));
                              });
                        } else
                          return AnswerCard(
                              answer: e.question,
                              isSelected: false,
                              isCorrect: false,
                              isDisplayingAnswer: false,
                              onTap: () {
                                print({"answer", question.answer + 1});
                                print({"itemOrder", e.itemOrder});
                                context.read<QuizBloc>().add(QuizCheckAnswer(
                                      answerIndex: question.answer + 1,
                                      userAnswerIndex: e.itemOrder,
                                    ));
                              });
                      }))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback onTap;

  const AnswerCard({
    Key key,
    @required this.answer,
    @required this.isSelected,
    @required this.isCorrect,
    @required this.isDisplayingAnswer,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow,
          border: Border.all(
            color: isDisplayingAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                answer,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: isDisplayingAnswer && isCorrect
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ? const CircularIcon(icon: Icons.check, color: Colors.green)
                  : isSelected
                      ? const CircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                        )
                      : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  final PageController pageController;
  final AnimationController animationController;
  final double animation;
  final QuizState state;
  final int total;
  Function press;
  ProgressBar(
      {this.press,
      this.pageController,
      this.state,
      this.total,
      this.animation,
      this.animationController});
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  void nextQuest() {
    if (widget.pageController.page.toInt() + 1 < widget.total) {
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
      );
      context.read<QuizBloc>().add(QuizStableEvent());
    }
  }

  void initControllerAnimation() {
    animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        // update like setState
        widget.press();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    //animationController.forward().whenComplete(nextQuestion);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initControllerAnimation();
    print(widget.total);
    //final animationMain = useAnimation(animation);
    return BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizCheckAnswerSuccessful ||
              state is QuizCheckAnswerFailed) {
            animationController.stop();
            widget.press();
          }
          if (state is QuizStableState) {
            animationController.reset();

            // Then start it again
            // Once timer is finish go to the next qn
            animationController.forward().whenComplete(nextQuest);
          }
        },
        child: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3F4768), width: 3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(animation.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CircularIcon({
    Key key,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16.0,
      ),
    );
  }
}
