import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/sport_match_bloc/match.dart';

import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/components/body.dart';

class SportMatchScreen extends StatelessWidget {
  static const String routeName = "/sport_match_Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Account Settings')),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      // floatingActionButton:
      //     BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
      //   if (state is MatchLoadedSuccess) {
      //     return FloatingActionButton(
      //       onPressed: () => {
      //         if (state.matchData.content.customerPrediction == null)
      //           {
      //             // add end event
      //             // context
      //             // .read<MatchBloc>()
      //             // .add(MatchAddEnd(matchId: state.matchData.content.id.toString() , secondTeamScore: state.))
      //           }
      //         else
      //           {
      //             showSnackBar(
      //               context,
      //               "You Added Prediction Previous",
      //               SnackBarType.error,
      //             )
      //           }
      //       },
      //       child: Icon(Icons.sports_football_rounded),
      //     );
      //   } else
      //     return FloatingActionButton(
      //       backgroundColor: Colors.blueGrey.withOpacity(0.5),
      //     );
      // }),
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration.copyWith(
          image: DecorationImage(
            image: AssetImage("assets/images/playGround1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: BodySportMatch()),
      ),
    );
  }
}
