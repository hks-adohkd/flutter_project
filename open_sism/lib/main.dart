import 'package:flutter/material.dart';
import 'package:open_sism/routes.dart';
import 'package:open_sism/screens/home/home_screen.dart';
import 'package:open_sism/screens/login/login_screen.dart';
import 'package:open_sism/screens/profile/profile_screen.dart';
import 'package:open_sism/screens/register/register_screen.dart';
import 'package:open_sism/screens/task/task_screen.dart';
import 'package:open_sism/screens/reward/rewards_screen.dart';
import 'package:open_sism/screens/task/detailedTask_screen.dart';
import 'package:open_sism/screens/profile/account_screen/account_screen.dart';
import 'package:open_sism/screens/profile/help_support/Help_support_screen.dart';
import 'package:open_sism/screens/activity/activity_screen.dart';
import 'package:open_sism/theme.dart';
import 'package:open_sism/screens/profile/ProfileScreenGradiant.dart';
import 'package:open_sism/screens/activity/message/message_screen.dart';
import 'package:open_sism/screens/activity/order/order_screen.dart';
import 'package:open_sism/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/screens/otp/otp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is   also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              deafultButton('reward Screen', RewardScreen.routeName),
              deafultButton('task Screen', TaskScreen.routeName),
              deafultButton('profile', ProfileScreenGradient.routeName),
              deafultButton('account ', AccountScreen.routeName),
              deafultButton('home', HomeScreen.routeName),
              deafultButton('About US', AboutUs.routeName),
              deafultButton('message', Messages.routeName),
              deafultButton('Order', Order.routeName),
              deafultButton('finished Task', FinishedTask.routeName),
              deafultButton('Register', RegisterScreen.routeName),
              deafultButton('Otp', OtpScreen.routeName),
              ElevatedButton(
                child: Text('Home Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Sign in'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  deafultButton(String title, String route) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        Navigator.pushNamed(context, route);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return wg;
        //     },
        //   ),
        // );
      },
    );
  }
}
