import 'package:flutter/material.dart';
import 'package:open_sism/routes.dart';
import 'package:open_sism/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/screens/game/spin_games/spin/spin_screen.dart';
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
import 'package:open_sism/screens/game/game_screen.dart';
import 'package:open_sism/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/screens/game/daily_bonus/dailyBonusScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
      initialRoute: LoginScreen.routeName,
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
