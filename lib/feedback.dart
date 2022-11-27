import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';

class feedbackPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: feedbackCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class feedbackCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
      ),
    );
  }
}