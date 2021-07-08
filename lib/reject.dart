import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Reject extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Rejectstate();
  }
}

 var message = " " ;
    getreject() async {
    var response = await http.get(Uri.parse("https://flutter--task.herokuapp.com/reject"));
    var responsebody = json.decode(response.body) ;
    print(responsebody );
    message = responsebody['message'];
    print(responsebody['message']) ;
    print("==================================");
    print(message);
    return responsebody ;
  }


class Rejectstate extends State<Reject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reject Request"),
      ),
      body:  FutureBuilder (future: getreject() ,
         builder: (BuildContext context , AsyncSnapshot snapshot){
           if(snapshot.hasError){
             print(snapshot.error);
             return Container();
           }else{
      if(snapshot.hasData)
      {  return Center(child: Center(
            child: Text(message , style: TextStyle(
    fontSize: 30, color: Colors.blue),),
          ),); }
      else {
        return Center(child: CircularProgressIndicator());
      }
           }
         })
    );
  }
}