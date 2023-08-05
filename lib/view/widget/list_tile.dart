
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:saltuapp/data/model/characterModel.dart' as ch;

class ListTileRow extends StatelessWidget {
   ListTileRow({Key? key,this.image,this.data}) : super(key: key);

  final ch.Character? data;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

          Expanded(
            flex:1,
            child: AvatarGlow(
            //glowColor: Colors.grey,
            endRadius: 60.0,
            child: Material(     // Replace this child with your own
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(image!,),
                radius: 30.0,
              ),
            ),
          ),),
          SizedBox(width: 10,),

          Expanded(
            flex:3,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data!.name,style: TextStyle(fontSize: 14,color: Colors.black),),
              //SizedBox(height: 5,),
              Text(data!.characterClass,style: TextStyle(fontSize: 12,color: Colors.grey))
            ],
          ),),


          Expanded(
            flex: 1,
              child:   CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30.0,
              ),)
        ],
      ),

    );
  }
}
