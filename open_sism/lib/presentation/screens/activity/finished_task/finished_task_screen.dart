import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/components/build_finished_task.dart';

BuildFinishedTask finishedTask = BuildFinishedTask();

class FinishedTask extends StatefulWidget {
  static String routeName = "/finishedTaskScreen";
  @override
  _FinishedTaskState createState() => _FinishedTaskState();
}

class _FinishedTaskState extends State<FinishedTask> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.13),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: kBoxDecoration,
                child: ListView.builder(
                    itemCount: finishedTask.finishedTaskLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return finishedTask.buildList(context, index);
                    }),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Finished Task",
                        style: kHeadingStyle,
                      ),
                    ),

                    //SizedBox(height: SizeConfig.screenHeight * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
