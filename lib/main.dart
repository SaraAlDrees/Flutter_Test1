import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'Timer.dart';
import 'home.dart';


//to handle background/ termenited notification
Future backgroundmessage(RemoteMessage message)async{
    await Firebase.initializeApp();
  
  print("Handling a background message: ${message.messageId}");

  // Use this method to automatically convert the push data, in case you gonna use our data standard
  AwesomeNotifications().createNotificationFromJsonData(message.data);
  
 }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

//to handle background notification
 FirebaseMessaging.onBackgroundMessage(backgroundmessage);


  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
         '/navigationPage' :(context)=>Timer()
       },
       debugShowCheckedModeBanner: false,
      title: 'Notification / Upload_Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
     body: Center(child: Text("Notification"))
    );
  }
}
  

