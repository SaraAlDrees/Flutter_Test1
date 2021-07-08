import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http ;


class UploadImg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UploadImgstate() ;

  }

}
 var response_message = " ";

 
File file ;
final picker = ImagePicker();

  

class UploadImgstate extends State<UploadImg> {

Future pickImage(int x ) async {
    var imgpicked ;
    if(x == 0){
    imgpicked = await picker.getImage(source: ImageSource.camera ,
    //  final pickedFile = await picker.getImage(source: ImageSource.gallery);
     imageQuality: 85 ,
     maxHeight:  400 , maxWidth: 400 ) ;
    }else
    {
     imgpicked = await picker.getImage(source: ImageSource.gallery ,
     imageQuality: 85 ,
     maxHeight:  400 , maxWidth: 400 ) ;
    }

  
    if(imgpicked != null)
    {
      setState(() {
      file = File(imgpicked.path);
    });
         
    } else{ }
    
    }

void uploadImage(String _image) async {

   try{
   var request = http.MultipartRequest('POST', Uri.parse('https://flutter--task.herokuapp.com/uploadImage'));
request.files.add(await http.MultipartFile.fromPath('img', _image));

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  setState(() {
      response_message = "Upload successful";
    });
  
}

else {
  print(response.reasonPhrase);
  
}

 }
 catch(e){
   print(e) ;

 }
 }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
        title: Text("pickImage"),
      ),
      body: Column(
        children: [
          Center( child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: () {
                pickImage(0);
              },
              child:  Icon(Icons.camera),),
              RaisedButton(onPressed: () {
                pickImage(1);
              },
              child:  Icon(Icons.photo_album),),
            ],
          )),

          Center(child: RaisedButton(onPressed: () {
            
            uploadImage(file.path);
          },
          child:  Text ("upload Image To Test Server"),)),

          SizedBox(height: 50,) ,

          file == null ? Text("No Image Selected ") :
          Container( height: MediaQuery.of(context).size.height/3 ,width: MediaQuery.of(context).size.width
          ,child: Image.file(file)),
          
           SizedBox(height: 50,width: 50,) ,

           Text(response_message) ,

        ],
      )
       );    
    
    
  }


 }