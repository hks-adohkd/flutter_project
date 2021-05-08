import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/components/card_component.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'task_info_screen.dart';
import 'detailedTask_screen.dart';

class TaskScreen extends StatefulWidget {
  static String routeName = "/taskScreen";

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Task",
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: kGradiantsPrimaryColor,
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          constraints: BoxConstraints.expand(),
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
                    child: GridView.builder(
                      itemCount: recipeBundles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            SizeConfig.orientation == Orientation.landscape
                                ? 2
                                : 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing:
                            SizeConfig.orientation == Orientation.landscape
                                ? SizeConfig.defaultSize * 2
                                : 0,
                        childAspectRatio: 1.65,
                      ),
                      itemBuilder: (context, index) => RecipeBundelCard(
                        selectedGender: ScreenType.task,
                        recipeBundle: recipeBundles[index],
                        press: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(
                                      product: recipeBundles[index]);
                                },
                              ),
                            );
                          });
                        },
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
