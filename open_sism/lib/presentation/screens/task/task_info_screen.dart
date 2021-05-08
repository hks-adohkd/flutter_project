import 'package:flutter/material.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/components/card_component.dart';
import 'package:open_sism/presentation/components/alert_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// this class not used yet
class TaskInfoScreen extends StatefulWidget {
  final TaskBundle taskBundle;
  TaskInfoScreen({@required this.taskBundle});
  @override
  _TaskInfoScreenState createState() => _TaskInfoScreenState();
}

bool scrollBarShown() {
  if (SizeConfig.orientation == Orientation.landscape) {
    return true;
  } else
    return false;
}

class _TaskInfoScreenState extends State<TaskInfoScreen> {
  bool scrollShown;
  var result;
  AlertWidget startTaskAlert = AlertWidget();

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
                // TODO:
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
    SizeConfig().init(context);
    scrollShown = scrollBarShown();
    //double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: 'Task Information',
          leadingIcon: Icons.arrow_back_ios,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                // Color(0xff002171),
                // Color(0xff8bf6ff),
                Color(0xff512DA8),
                Color(0xff536DFE),
              ],
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          //constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //Categories(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: Scrollbar(
                      isAlwaysShown: scrollShown,
                      hoverThickness: 10,
                      thickness: 20,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: SizeConfig.orientation ==
                                          Orientation.landscape
                                      ? 2
                                      : 1,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: SizeConfig.orientation ==
                                          Orientation.landscape
                                      ? SizeConfig.defaultSize * 2
                                      : 0,
                                  childAspectRatio: 1.65,
                                ),
                                itemBuilder: (context, index) =>
                                    RecipeBundelCard(
                                  selectedGender: ScreenType.task,
                                  recipeBundle: widget.taskBundle,
                                  press: () {},
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  'this is a gift card for google play this is a gift card for google play'),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  result = await startTaskAlert
                                      .onAlertButtonsPressed(
                                    context,
                                    "Start Task ALERT",
                                    "Are you sure to start this Task",
                                  );
                                  startTaskResultAweasom(result);
                                },
                                child: Text('Start Task'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
