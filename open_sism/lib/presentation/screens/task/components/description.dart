import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/task/components/customButton.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TaskTypes tasks;

class Description extends StatefulWidget {
  Description();
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomButton(),
          BlocBuilder<SingleTaskBloc, SingleTaskState>(
            builder: (context, state) {
              if (state is SingleTaskLoadedSuccess) {
                return Text(
                  state.recipeBundles != null
                      ? state.recipeBundles.description
                      : " ",
                  style: TextStyle(height: 1.5),
                );
              } else
                return Text(" ");
            },
          ),
        ],
      ),
    );
  }
}
