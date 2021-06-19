import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';
import 'package:open_sism/presentation/screens/quiz/component/score_screen.dart';

// We use get package for our state management

class QuestionController {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  // Lets animated our progress bar
//   QuestionController() {
//     animationController = AnimationController(duration: Duration(seconds: 60));
//     animation = Tween<double>(begin: 0, end: 1).animate(animationController)
//       ..addListener(() {
//         // update like setState
//         //   update();
//         updateAnimation();
//       });
//
//     // start our animation
//     // Once 60s is completed go to the next qn
//     animationController.forward().whenComplete(nextQuestion);
//     pageController = PageController();
//   }
//
//   AnimationController animationController;
//   Animation animation;
//   // so that we can access our animation outside
//   // Animation get animation => this._animation;
//
//   PageController pageController;
//   // PageController get pageController => this._pageController;
//
//   List<Question> questions;
//
// //  List<Question> get questions => this._questions;
//
//   bool isAnswered = false;
//   // bool get isAnswered => this._isAnswered;
//
//   int correctAns;
// //  int get correctAns => this._correctAns;
//
//   int selectedAns;
//   // int get selectedAns => this._selectedAns;
//
//   // for more about obs please check documentation
//   RxInt questionNumber = 1.obs;
// //  RxInt get questionNumber => this._questionNumber;
//
//   int numOfCorrectAns = 0;
// //  int get numOfCorrectAns => this._numOfCorrectAns;
//
//   // called immediately after the widget is allocated memory
//   @override
//   void onInit() {
//     // Our animation duration is 60 s
//     // so our plan is to fill the progress bar within 60s
//     animationController = AnimationController(duration: Duration(seconds: 60));
//     animation = Tween<double>(begin: 0, end: 1).animate(animationController)
//       ..addListener(() {
//         // update like setState
//         //   update();
//         updateAnimation();
//       });
//
//     // start our animation
//     // Once 60s is completed go to the next qn
//     animationController.forward().whenComplete(nextQuestion);
//     pageController = PageController();
//     // super.onInit();
//   }
//
//   void updateAnimation() {}
//   // // called just before the Controller is deleted from memory
//   @override
//   void onClose() {
//     //  super.onClose();
//     animationController.dispose();
//     pageController.dispose();
//   }
//
//   void checkAns(Question question, int selectedIndex) {
//     // because once user press any option then it will run
//     isAnswered = true;
//     correctAns = question.answer;
//     selectedAns = selectedIndex;
//
//     if (correctAns == selectedAns) numOfCorrectAns++;
//
//     // It will stop the counter
//     animationController.stop();
//     // update();
//     updateAnimation();
//     // Once user select an ans after 3s it will go to the next qn
//     Future.delayed(Duration(seconds: 3), () {
//       nextQuestion();
//     });
//   }
//
//   void nextQuestion() {
//     if (questionNumber.value != questions.length) {
//       isAnswered = false;
//       pageController.nextPage(
//           duration: Duration(milliseconds: 250), curve: Curves.ease);
//
//       // Reset the counter
//       animationController.reset();
//
//       // Then start it again
//       // Once timer is finish go to the next qn
//       animationController.forward().whenComplete(nextQuestion);
//     } else {
//       // Get package provide us simple way to naviigate another page
//       // Get.to(ScoreScreen());
//     }
//   }
//
//   void updateTheQnNum(int index) {
//     questionNumber.value = index + 1;
//   }
}
