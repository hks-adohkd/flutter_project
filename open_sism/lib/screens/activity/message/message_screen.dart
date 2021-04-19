import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/screens/activity/message/components/build_message.dart';

class Messages extends StatefulWidget {
  static String routeName = "/messageScreen";
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  BuildMessage buildMessage = BuildMessage();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03), // 4%
                Text(
                  "Messages",
                  style: kHeadingStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  height: SizeConfig.screenHeight * 0.8,
                  child: ListView.builder(
                      itemCount: buildMessage.messageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildMessage.buildList(context, index,
                            buildMessage.messageList[index]['id']);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
