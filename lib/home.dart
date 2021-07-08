import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:untitled/reject.dart';
import 'package:untitled/reply.dart';
import 'Timer.dart';
import 'package:untitled/uploadImg.dart';




class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState() ;
}
}



Future awesominit() async{

 // print("Done11111") ;
 await AwesomeNotifications().initialize(null, [
  NotificationChannel(
     channelKey: 'basic_channel',
    channelName: 'Basic notifications',
    channelDescription: 'Notification channel for basic tests',
    defaultColor: Color(0xFF9D50DD),
    ledColor: Colors.white,
    playSound: true ,
    enableVibration: true,
            ),
  ]) ;

}

Future getnotification(context) async {

  AwesomeNotifications().actionStream.listen((event) {


   if(event.buttonKeyPressed == 'REPLY')
   {
    
     Navigator.push(context, MaterialPageRoute(builder: (context) => Reply())) ;
      

   }else
   if(event.buttonKeyPressed == 'REJECT')
   {
     Navigator.push(context, MaterialPageRoute(builder: (context) => Reject())) ;

   }
   else

      Navigator.push(context, MaterialPageRoute(builder: (context) => Timer())) ;
  
  });


 

}
 
Future onmessage () async {
     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
          print('Message data: ${message.data}');
       AwesomeNotifications().createNotificationFromJsonData(message.data);
      if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
  }
});

 }


class HomeState extends State<Home>{

var fbm = FirebaseMessaging.instance ;


   @override
  void initState() {
    super.initState();
    awesominit();
    getnotification(context);
    fbm.getToken().then((token){
      print('=========================token=========================');
      print(token);
      print('====================================================');
    });
     onmessage();
    
     
  } 
  
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Notification/upload_Image"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImg())) ;
              },
              child: Text("Test Upload Image "),
            ),
         
        
             ],
        ),
      ),
    );
  }
}
 


   



