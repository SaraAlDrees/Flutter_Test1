import 'dart:async';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Timer extends StatefulWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Timer",
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return Timer25() ;

  }



}


class Timer25 extends State<Timer>{

  CountDownController _controller = CountDownController();
  int _duration = 25;

  @override
  void initState() {
  
    super.initState();
  }// final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer25"),
      ),
      body: Center(
          child: CircularCountDownTimer(
            // Countdown duration in Seconds.
            duration: 26,
            // Countdown initial elapsed Duration in Seconds.
            initialDuration: 0,
            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
            controller: _controller,
            // Width of the Countdown Widget.
            width: MediaQuery
                .of(context)
                .size
                .width / 2,

            // Height of the Countdown Widget.
            height: MediaQuery
                .of(context)
                .size
                .height / 2,

            // Ring Color for Countdown Widget.
            ringColor: Colors.grey[300],

            // Ring Gradient for Countdown Widget.
            ringGradient: null,

            // Filling Color for Countdown Widget.
            fillColor: Colors.blue[100],

            // Filling Gradient for Countdown Widget.
            fillGradient: null,

            // Background Color for Countdown Widget.
            backgroundColor: Colors.blue[500],

            // Background Gradient for Countdown Widget.
            backgroundGradient: null,

            // Border Thickness of the Countdown Ring.
            strokeWidth: 20.0,

            // Begin and end contours with a flat edge and no extension.
            strokeCap: StrokeCap.round,

            // Text Style for Countdown Text.
            textStyle: TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),

            // Format for the Countdown Text.
            textFormat: CountdownTextFormat.S,

            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
            isReverse: true,

            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
            isReverseAnimation: true,

            // Handles visibility of the Countdown Text.
            isTimerTextShown: true,

            // Handles the timer start.
            autoStart: true,

            // This Callback will execute when the Countdown Starts.
            onStart: () {
              _controller.start();
              // Here, do whatever you want
              print('Countdown Started');
            },

            // This Callback will execute when the Countdown Ends.
            onComplete: () {
              // Here, do whatever you want
              print('Countdown Ended');
              Navigator.pop(context);
            },
          )),
      /*floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Pause", onPressed: () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Resume", onPressed: () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration))
        ],
      ),*/
    );
  }

 /* _button({ String title, VoidCallback onPressed}) {
    return Expanded(
        child: RaisedButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed,
          color: Colors.purple,
        ));
  }*/


}