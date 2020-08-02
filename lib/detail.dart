import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 500,
              child: Image(image: AssetImage("assets/temp_splash.png"),fit: BoxFit.cover,)
            )
          ],
        ),
      ),
      
    );
  }
}