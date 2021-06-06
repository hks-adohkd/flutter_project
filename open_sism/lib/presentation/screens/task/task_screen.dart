import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/components/card_component.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'detailedTask_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_state.dart';
import 'package:open_sism/logic/blocs/taskBloc/task_bloc.dart';
import 'package:open_sism/logic/blocs/taskBloc/task_state.dart';

class TaskScreen extends StatefulWidget {
  static const String routeName = "/taskScreen";

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
                    child: BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        if (state is TaskLoadedSuccess) {
                          List<TaskBundle> taskList =
                              createPrizeList(state: state);
                          //print(prizeList.first.description);
                          return buildGridView(taskList);
                        } else
                          return Container();
                      },
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

  GridView buildGridView(List<TaskBundle> taskList) {
    return GridView.builder(
      itemCount: recipeBundles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: SizeConfig.orientation == Orientation.landscape
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
                  return DetailsScreen(product: recipeBundles[index]);
                },
              ),
            );
          });
        },
      ),
    );
  }

  List<TaskBundle> createPrizeList({TaskState state}) {
    //List<PrizeBundle> prizeBundles;
    if (state is TaskLoadedSuccess) {
      return recipeBundles = state.taskData.content.content
          .map(
            (item) => TaskBundle(
              id: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].id,
              description: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .description,
              imageSrc: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .imageUrl,
              person: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].limit,
              title: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .displayName,
              color: getTaskColor(
                  state, state.taskData.content.content.indexOf(item)),
              icon: getTaskIcon(
                  state, state.taskData.content.content.indexOf(item)),
              points: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].points,
              hours: calculateTaskHour(
                  state, state.taskData.content.content.indexOf(item)),
              startDate: getStartDate(
                  state, state.taskData.content.content.indexOf(item)),
              endDate: getEndDate(
                  state, state.taskData.content.content.indexOf(item)),
              isDone: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].isDone,
              isForAll: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .isForAll,
              isReachLimit: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .isReachLimit,
              link: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].link,
              packageName: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .packageName,
              pageId: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].pageId,
              stared: state.taskData.content
                  .content[state.taskData.content.content.indexOf(item)].stared,
              taskType: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .taskType,
              videoDuration: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .videoDuration,
              videoId: state
                  .taskData
                  .content
                  .content[state.taskData.content.content.indexOf(item)]
                  .videoId,
            ),
          )
          .toList();
    } else
      return null;
  }

  int calculateTaskHour(TaskLoadedSuccess state, int index) {
    DateTime startDate = state.taskData.content.content[index].startDate;
    DateTime endDate = state.taskData.content.content[index].endDate;
    return endDate.day - startDate.day;
  }

  Color getTaskColor(TaskLoadedSuccess state, int index) {
    String _name = state.taskData.content.content[index].taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return kYoutubeCardColor;
    } else if (_name == "whatch ad") {
      return kWatchVideoCardColor;
    } else
      return kQuestionnaireCardColor;
  }

  IconData getTaskIcon(TaskLoadedSuccess state, int index) {
    String _name = state.taskData.content.content[index].taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return FontAwesomeIcons.youtube;
    } else if (_name == "whatch ad") {
      return FontAwesomeIcons.video;
    } else
      return FontAwesomeIcons.question;
  }

  String getStartDate(TaskLoadedSuccess state, int index) {
    String year =
        state.taskData.content.content[index].startDate.year.toString();
    String month =
        state.taskData.content.content[index].startDate.month.toString();
    String day = state.taskData.content.content[index].startDate.day.toString();

    return year + " : " + month + " : " + day;
  }

  String getEndDate(TaskLoadedSuccess state, int index) {
    String year = state.taskData.content.content[index].endDate.year.toString();
    String month =
        state.taskData.content.content[index].endDate.month.toString();
    String day = state.taskData.content.content[index].endDate.day.toString();
    return year + " : " + month + " : " + day;
  }
}
