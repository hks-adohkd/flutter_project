import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/quiz/quiz.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';
import 'package:open_sism/presentation/screens/quiz/component/quiz_page.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/sport_match_screen.dart';
import 'package:open_sism/presentation/components/alert_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/sport_match_bloc/match.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';
import 'package:open_sism/presentation/screens/web_view/web_view_hidden.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_sism/presentation/screens/quiz/component/quiz_main.dart';

class StartTaskAlertButton extends StatefulWidget with WidgetsBindingObserver {
  const StartTaskAlertButton({
    Key key,
  }) : super(key: key);

  @override
  _StartTaskAlertButtonState createState() => _StartTaskAlertButtonState();
}

class _StartTaskAlertButtonState extends State<StartTaskAlertButton>
    with WidgetsBindingObserver {
  AppLifecycleState _notification;
  //Then when you want to know what is the state, check _notification.index property
  // . _notification == null => no state changes happened, 0 - resumed, 1 - inactive, 2 - paused.
  AlertWidget startTaskAlert = AlertWidget();

  var result;
  // return success dialog after redeemption accepted
  startTaskResultAweasom(bool result, TaskBundle taskBundle, String taskType) {
    if (result) {
      if (taskType == "sport_match") {
        context
            .read<MatchBloc>()
            .add(MatchDataRequested(taskId: taskBundle.id.toString()));
        Navigator.pushNamed(context, SportMatchScreen.routeName);
      }

      if (taskType == "open_link") {
        //  Navigator.pushNamed(context, WebViewHome.routeName);
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => WebViewHidden(url: taskBundle.link)));
        _launchURL(taskBundle.link);
      }
      if (taskType == "watch_ad") {
        _launchURL(taskBundle.link);
      }
      if (taskType == "quiz") {
        //  Navigator.pushNamed(context, QuizScreen.routeName);
        context.read<QuizBloc>().add(QuizDataRequested(taskId: taskBundle.id));
        Navigator.pushNamed(context, QuizScreen.routeName);
      }
    }
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
// }

  // MaterialButton(
  // onPressed: () {
  // Navigator.of(context).push(MaterialPageRoute(
  // builder: (context) => WebExampleFive(url: _url)));
  // },
  // child: Text(
  // 'Example 5',
  // style: TextStyle(color: Colors.white),
  // ),
  // color: Colors.yellow[900],
  // padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
  // ),

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");

        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (_notification != null) {
    //   print(_notification.index);
    //   if (_notification.index == 1) {
    //     print("other app opened");
    //   }
    //   if (_notification.index == 0) {
    //     print("app resumed");
    //   }
    // }
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: BlocBuilder<SingleTaskBloc, SingleTaskState>(
                  builder: (context, state) {
                if (state is SingleTaskLoadedSuccess) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      backgroundColor: Color(0xFF512DA8),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () async {
                      result = await startTaskAlert.onAlertButtonsPressed(
                        context,
                        "Start Task ALERT",
                        "Are you sure to start this Task",
                      );

                      startTaskResultAweasom(result, state.recipeBundles,
                          state.taskData.content.taskType.name);
                    },
                    child: Text(
                      "Start Task".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return Text(" ");
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/*
AlertWidget _startTaskAlert = AlertWidget();
class StartTaskAlertButton extends StatelessWidget {
  const StartTaskAlertButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final TaskBundle product;

  // return success dialog after redeemption accepted
  startTaskResultAweasom(bool result) {
    if (result) {
      return AwesomeDialog(
          context: context,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: 'Succes',
          desc: 'Task started put your code here ',
          btnOkOnPress: () {
            //  debugPrint('OnClcik');
          },
          btnOkIcon: Icons.check_circle,
          onDissmissCallback: () {
            // debugPrint('Dialog Dissmiss from callback');
          })
          .show();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                  backgroundColor: Color(0xFF512DA8),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {},
                child: Text(
                  "Start Task".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/
