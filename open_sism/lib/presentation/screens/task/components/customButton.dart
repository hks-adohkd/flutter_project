import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';

class CustomButton extends StatefulWidget {
  CustomButton();
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleTaskBloc, SingleTaskState>(
      builder: (context, state) {
        if (state is SingleTaskLoadedSuccess) {
          return Visibility(
            visible: state.recipeBundles.tutorailLink != null ? true : false,
            child: MaterialButton(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(16.0),
              onPressed: () async {
                if (await canLaunch(state.recipeBundles.tutorailLink))
                  launch(state.recipeBundles.tutorailLink);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        //state.recipeBundles.icon,
                        FontAwesomeIcons.link,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        state.recipeBundles != null
                            ? state.recipeBundles.title + " Tutorial"
                            : " ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        } else
          return Text(" ");
      },
    );

    // return MaterialButton(
    //   color: Colors.grey.shade200,
    //   padding: const EdgeInsets.all(16.0),
    //   onPressed: () async {
    //     // if (await canLaunch(widget.product.link)) launch(widget.product.link);
    //   },
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           BlocBuilder<SingleTaskBloc, SingleTaskState>(
    //             builder: (context, state) {
    //               if (state is SingleTaskLoadedSuccess) {
    //                 return Icon(
    //                   state.recipeBundles.icon,
    //                   color: Colors.red,
    //                 );
    //               } else
    //                 return Icon(Icons.question_answer);
    //             },
    //           ),
    //           const SizedBox(width: 10.0),
    //           BlocBuilder<SingleTaskBloc, SingleTaskState>(
    //             builder: (context, state) {
    //               if (state is SingleTaskLoadedSuccess) {
    //                 return Text(
    //                   state.recipeBundles != null
    //                       ? state.recipeBundles.title + " Tutorial"
    //                       : " ",
    //                   style: TextStyle(
    //                       color: Theme.of(context).primaryColor,
    //                       fontSize: 20.0,
    //                       fontWeight: FontWeight.bold),
    //                 );
    //               } else
    //                 return Text(" ");
    //             },
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 10.0),
    //
    //     ],
    //   ),
    // );
  }
}
