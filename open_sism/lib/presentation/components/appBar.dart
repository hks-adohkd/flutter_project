import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_bloc.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_event.dart';
import 'package:open_sism/logic/blocs/notificationBloc/notification_bloc.dart';
import 'package:open_sism/logic/blocs/notificationBloc/notification_event.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/activity/message/message_screen.dart';
import 'package:open_sism/presentation/screens/activity/notification/notification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReusableAppBar extends StatelessWidget {
  final String appBarTitle;
  final IconData leadingIcon;
  final bool isHome;
  final bool newMessage, newNotification;

  ReusableAppBar(
      {@required this.appBarTitle,
      this.leadingIcon = Icons.home,
      this.isHome = false,
      this.newNotification = false,
      this.newMessage = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: true
          ? LeadingAppBarIcon(
              leadingIcon: leadingIcon,
            )
          : IconButton(
              icon: Image.asset('assets/images/logo.png'), onPressed: () => {}),
      actions: isHome
          ? [
              Center(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<NotificationBloc>()
                        .add(NotificationPageRequested());
                    Navigator.pushNamed(context, Notifications.routeName);
                  },
                  child: Stack(
                    children: [
                      Icon(Icons.notifications),
                      Visibility(
                        visible: newNotification,
                        child: Positioned(
                            right: 0,
                            child: new Container(
                              padding: EdgeInsets.all(1),
                              decoration: new BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<ContactUsBloc>().add(ContactUsPageRequested());
                    Navigator.pushNamed(context, Messages.routeName);
                  },
                  child: Stack(
                    children: [
                      Icon(Icons.sms_rounded),
                      Visibility(
                        visible: newMessage,
                        child: Positioned(
                            right: 0,
                            child: new Container(
                              padding: EdgeInsets.all(1),
                              decoration: new BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ]
          : [],
      elevation: 5.0,
      backgroundColor: kAppBarBackgroundColor,
      centerTitle: true,
      shape: Cuvedshape(20),
      title: Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(
          appBarTitle,
          textAlign: TextAlign.end,
          style: kAppBarTextStyle,
        ),
      ),
    );
  }
}

class LeadingAppBarIcon extends StatelessWidget {
  final IconData leadingIcon;
  LeadingAppBarIcon({this.leadingIcon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // we shoud define route class and use here
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 8.0),
        child: Icon(
          leadingIcon,
          color: kAppBarLeadingIconColor,
          size: kAppBarLeadingIconSize, // add custom icons also
        ),
      ),
    );
  }
}

class Cuvedshape extends ContinuousRectangleBorder {
  const Cuvedshape(this.curveheights);
  final double curveheights;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(rect.size.width / 2,
        rect.size.height + curveheights * 2, rect.size.width, rect.size.height)
    ..lineTo(rect.size.width, 0)
    ..close();
}
