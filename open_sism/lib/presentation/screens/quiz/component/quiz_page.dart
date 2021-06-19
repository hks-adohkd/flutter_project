import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sism/presentation/screens/quiz/controllers/question_controller.dart';
//import 'package:open_sism/presentation/screens/quiz/component/body.dart';
import 'package:open_sism/presentation/screens/quiz/component/quiz_body.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  static const String routeName = "/quiz_page";
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    //QuestionController _controller = QuestionController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            //onPressed: _controller.nextQuestion,
            child: Text("Skip"),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
