import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';

class TimeAndPerson extends StatefulWidget {
  TimeAndPerson();
  @override
  _TimeAndPersonState createState() => _TimeAndPersonState();
}

class _TimeAndPersonState extends State<TimeAndPerson> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      ColorDot(
                        color: Colors.lightGreen,
                        isSelected: true,
                      ),
                      BlocBuilder<SingleTaskBloc, SingleTaskState>(
                        builder: (context, state) {
                          if (state is SingleTaskLoadedSuccess) {
                            return Text(
                              state.recipeBundles != null
                                  ? state.recipeBundles.startDate
                                  : " ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            );
                          } else
                            return Text(" ");
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ColorDot(
                        color: Colors.red,
                        isSelected: true,
                      ),
                      BlocBuilder<SingleTaskBloc, SingleTaskState>(
                        builder: (context, state) {
                          if (state is SingleTaskLoadedSuccess) {
                            return Text(
                              state.recipeBundles != null
                                  ? state.recipeBundles.endDate
                                  : " ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            );
                          } else
                            return Text(" ");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            children: [
              BlocBuilder<SingleTaskBloc, SingleTaskState>(
                builder: (context, state) {
                  if (state is SingleTaskLoadedSuccess) {
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Person\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.recipeBundles.person.toString(),
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF512DA8),
                                    ),
                          )
                        ],
                      ),
                    );
                  } else
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Person\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF512DA8),
                                    ),
                          )
                        ],
                      ),
                    );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            textBaseline: TextBaseline.alphabetic,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<SingleTaskBloc, SingleTaskState>(
                builder: (context, state) {
                  if (state is SingleTaskLoadedSuccess) {
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Point\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.recipeBundles.points.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    textBaseline: TextBaseline.alphabetic),
                          )
                        ],
                      ),
                    );
                  } else
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Point\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF512DA8),
                                    ),
                          )
                        ],
                      ),
                    );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
