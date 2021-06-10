import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_bloc.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_event.dart';
import 'package:open_sism/presentation/screens/activity/components/activityBundel.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/presentation/screens/activity/message/message_screen.dart';
import 'package:open_sism/presentation/screens/activity/order/order_screen.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_bloc.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_bloc.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_event.dart';

class ActivityRow extends StatelessWidget {
  final Activity activity;
  String type;

  ActivityRow({@required this.activity, this.type});

  String getRouteName(String type) {
    if (type == "Message") {
      return Messages.routeName;
    } else if (type == "Order") {
      return Order.routeName;
    } else if (type == "Finished Task") {
      return FinishedTask.routeName;
    } else
      return "no route";
  }

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(activity.image),
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
          new Text(activity.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(activity.location, style: subHeaderTextStyle),
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
        if (type == "Message") {
          context.read<ContactUsBloc>().add(ContactUsPageRequested());
          Navigator.pushNamed(context, getRouteName(type));
        } else if (type == "Order") {
          context.read<RequestedPrizeBloc>().add(RequestedPrizePageRequested());
          Navigator.pushNamed(context, getRouteName(type));
          //return Order.routeName;
        } else if (type == "Finished Task") {
          context.read<FinishedTaskBloc>().add(FinishedTaskPageRequested());
          Navigator.pushNamed(context, getRouteName(type));
          // return FinishedTask.routeName;
        } else {
          Navigator.pushNamed(context, getRouteName(type));
        }
        //  return "no route";
        //context.read<HomeBloc>().add(HomePageRequested());
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
