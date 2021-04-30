import 'package:flutter/material.dart';

class SingleBottomNavigation extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  const SingleBottomNavigation({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        color: Colors.lightGreen,
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[icon],
            ),
          ),
        ));
  }
}
