import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/sport_match_bloc/match.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';

class SportMatchForm extends StatefulWidget {
  @override
  _SportMatchFormState createState() => _SportMatchFormState();
}

class _SportMatchFormState extends State<SportMatchForm> {
  var firstTeamScoreController = TextEditingController(text: " ");
  var secondTeamScoreController = TextEditingController(text: " ");
  String firstTeamScore;
  String secondTeamScore;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final myController = TextEditingController();
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // const double avatarPadding = SizeConfig.screenHeight * 0.5;
    // to get the screen size
    return Form(
        key: _formKey,
        child: BlocListener<MatchBloc, MatchState>(
          listener: (context, state) {
            if (state is MatchLoadedSuccess) {
              if (state.matchData.content.customerPrediction != null) {
                firstTeamScoreController.text = state
                    .matchData.content.customerPrediction.firstTeamScore
                    .toString();
                secondTeamScoreController.text = state
                    .matchData.content.customerPrediction.secondTeamScore
                    .toString();
              } else {
                showSnackBar(
                  context,
                  "Add your Prediction",
                  SnackBarType.wheel,
                );
              }
            }
            if (state is MatchAddEndState) {
              showSnackBar(
                context,
                'Add result , please Wait ...',
                SnackBarType.loading,
              );
            }
            if (state is MatchEndMessageNotSuccess) {
              showSnackBar(
                context,
                state.message,
                SnackBarType.error,
              );
            }
            if (state is MatchMessageNotSuccess) {
              showSnackBar(
                context,
                state.message,
                SnackBarType.error,
              );
            }
            if (state is MatchEndSuccess) {
              showSnackBar(
                context,
                "Add Prediction successful",
                SnackBarType.wheel,
              );
              ScaffoldMessenger.of(context)..hideCurrentSnackBar();
              Future.delayed(const Duration(milliseconds: 2000), () {
                // function spin init state
                Navigator.pop(context);
              });

              // Scaffold.of(context).
              // hideCurrentSnackBar();
              //Phoenix.rebirth(context);
              // context.read<AccountBloc>().add(
              //   AccountPageRequested(),
              // );
            }
            if (state is MatchNotValidFormState) {
              showSnackBar(
                context,
                'Please Add All required information',
                SnackBarType.error,
              );
            } else {
              print("no");
              //isValidProfile = false;
              // showSnackBar(
              // context,
              // "Error Loading Profile",
              // SnackBarType.error,
              // );
            }
          },
          child: buildColumn(),
        ));
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            if (state is MatchLoadedSuccess) {
              return Text(
                state.matchData.content.firstTeamName,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              );
            } else
              return Text(" ");
          },
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _buildAvatar(),
        ),
        buildFirstTeamFormField(),
        // SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "VS",
          style: TextStyle(
              fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        // SizedBox(height: SizeConfig.screenHeight * 0.04),
        buildSecondTeamFormField(),

        SizedBox(height: SizeConfig.screenHeight * 0.03),
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: _buildAvatar(),
        ),
        BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            if (state is MatchLoadedSuccess) {
              return Text(
                state.matchData.content.secondTeamName,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              );
            } else
              return Text(" ");
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
            if (state is MatchLoadedSuccess) {
              return FloatingActionButton(
                onPressed: () {
                  if (state.matchData.content.customerPrediction == null) {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(firstTeamScore);
                      print(secondTeamScore);
                      print(state.matchData.content.id.toString());
                      context.read<MatchBloc>().add(MatchAddEnd(
                          matchId: state.matchData.content.id.toString(),
                          secondTeamScore: secondTeamScore,
                          firstTeamScore: firstTeamScore));
                    }
                  } else {
                    showSnackBar(
                      context,
                      "You Added Prediction Previous",
                      SnackBarType.error,
                    );
                  }
                },
                child: Icon(Icons.sports_football_rounded),
              );
            } else
              return FloatingActionButton(
                backgroundColor: Colors.blueGrey.withOpacity(0.5),
              );
          }),
        ),
      ],
    );
  }

  Container buildFirstTeamFormField() {
    return Container(
      width: SizeConfig.screenWidth / 4,
      child: TextFormField(
        controller: firstTeamScoreController,
        onSaved: (newValue) => {
          setState(() {
            firstTeamScore = newValue;
          })
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: "Add First Team Score");
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: "Add First Team Score");
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.blueGrey,
          filled: true,
        ),
      ),
    );
  }

  Container buildSecondTeamFormField() {
    return Container(
      width: SizeConfig.screenWidth / 4,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            secondTeamScore = newValue;
          })
        },
        controller: secondTeamScoreController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: "Add Second Team Score");
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: "Add Second Team Score");
            return "";
          }
          return null;
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          fillColor: Colors.blueGrey,
          filled: true,
        ),
      ),
    );
  }

  _buildAvatar() {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      // margin: const EdgeInsets.only(top: 32.0, left: 16.0),
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: Image(
          image: AssetImage("assets/images/logoBodyCircle.png"),
        ),
      ),
    );
  }
}
