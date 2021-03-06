import 'package:flutter/material.dart';
import 'package:open_sism/presentation/screens/game/components/game_bundle.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_event.dart';

class GameRow extends StatelessWidget {
  final Game game;
  String type;

  GameRow({@required this.game, this.type});

  String getRouteName(String type) {
    if (type == "Spin Wheel") {
      return WhellFortune.routeName;
    } else if (type == "Golden Spin Wheel") {
      return GoldWheelFortune.routeName;
    } else
      return "no route";
  }

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(game.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _planetValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
      ]);
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(game.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(game.details, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        if (getRouteName(type) == WhellFortune.routeName) {
          context.read<WheelBloc>().add(WheelPageRequested());
        } else if (getRouteName(type) == GoldWheelFortune.routeName) {
          context.read<WheelPremiumBloc>().add(WheelPremiumPageRequested());
          // context.read<WheelPremiumBloc>().add(WheelPremiumCustomerRequested());
          print("event WheelPremiumCustomerRequested added ");
        }

        Navigator.pushNamed(context, getRouteName(type));
      },
      child: new Container(
          height: 120.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          )),
    );
  }
}
