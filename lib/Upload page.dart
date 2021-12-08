import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Post Issue",style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 20,),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              lightSource: LightSource.topLeft,
            ),
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo),
                  SizedBox(height: 20,),
                  Text("Upload\nPhoto",textAlign: TextAlign.center,),
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 80,),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -4,
              lightSource: LightSource.topLeft,
//                    color: Colors.grey
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter title",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:10)
              ),
            ),
          ),
          SizedBox(height: 20,),

          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -4,
              lightSource: LightSource.topLeft,
//                    color: Colors.grey
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter Description",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:10,top: 10,bottom: 10)

              ),
              minLines: 4,
              maxLines: 4,
            ),
          ),
          SizedBox(height: 30.0,),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -4,
              lightSource: LightSource.topLeft,
//                    color: Colors.grey
            ),
            child: DropdownButtonFormField<int>(
              onChanged: (i){


              },

              decoration: InputDecoration(
                  hintText: "Select Category",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:10)
              ),

            ),
          ),
          SizedBox(height: 50.0,),
        NeumorphicButton(
          onPressed: () {},
          child: Center(
            child: Text("Upload",style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          ),
          style: NeumorphicStyle(
            color: Colors.blue,
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 8,
//                lightSource: LightSource.topLeft,
          ),
        )

        ],
      ),
    );
  }
}
