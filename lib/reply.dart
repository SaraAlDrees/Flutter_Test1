import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Reply extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Replystate();
  }
}

 var message = " " ;
    getreply() async {
    var response = await http.get(Uri.parse("https://flutter--task.herokuapp.com/reply"));
    var responsebody = json.decode(response.body) ;
    print(responsebody );
    message = responsebody['message'];
    print(responsebody['message']) ;
    print("==================================");
    print(message);
    return responsebody ;
  }


class Replystate extends State<Reply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reply Request"),
      ),
      body:  FutureBuilder (future: getreply() ,
         builder: (BuildContext context , AsyncSnapshot snapshot){
           if(snapshot.hasError){
             print(snapshot.error);
             return Container();
           }else{
      if(snapshot.hasData)
      {  return Center(child:  Text(message , style: TextStyle(
    fontSize: 30, color: Colors.blue),),); }
      else {
        return Center(child: CircularProgressIndicator());
      }
           }
         })
    );
  }
}