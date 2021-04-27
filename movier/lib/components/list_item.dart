import 'package:flutter/material.dart';

class ListItem {
 // class constructor
 ListItem(this.id,this.popularity, this.releaseDate, this.runTime, this.title);

 // class fields
 final int id;
 final String title;
 final String releaseDate;
 final int popularity;
 final int runTime;
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key key, this.listItem}) : super(key: key);

  final ListItem listItem;
  @override
  Widget build(BuildContext context) {
    return  Stack(
       children: [
         Text(listItem.title),
         Stack(children: [  
          Text(listItem.releaseDate),
          Text(listItem.runTime.toString()), 
         ],)
       ],
    );
  }
}