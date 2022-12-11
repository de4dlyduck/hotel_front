import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/ocupRoom.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/ocupRoom.dart';
import 'package:hotel_front/profile.dart';
import 'package:hotel_front/addPenalties.dart';
import 'package:hotel_front/roomAdmin.dart';
import 'package:hotel_front/profileAdmin.dart';
import 'package:http/http.dart' as http;

import 'models.dart';


late int ind;
String tel='';
late List<Date> RdateallRoom;


Future<void> decallRoom() async {
  final response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/hotel/UserAllRoom/${tel}"));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  RdateallRoom =
      json.map((e) => Date.fromJson(e as Map<String, dynamic>)).toList();

}


class navigationBarsideAdmin extends StatelessWidget {
  navigationBarsideAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child:Text(
                "Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text("Номера"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>roomPageAdmin()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Профиль"),
            onTap: () async {
              await decProfile();
              Navigator.push(context, MaterialPageRoute(builder:(context)=>profilePageAdmin()));
            },
          ),
          ListTile(
            leading: Icon(Icons.meeting_room_outlined),
            title: Text("Занятые номера"),
            onTap: () async {
              showDialog(context: context, builder:(context)=>taketel());
            },
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Штрафы"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>addPagePenat()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
            onTap: (){
              showDialog(context: context, builder: (context) => exit()).then((
                  e) {
                if (id==0) {
                  RdateProfile.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => logPage()));
                }
              });
            },
          ),

        ],
      ),
    );
  }
}



class taketel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 170,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Введите телефон',
                ),
                onSubmitted: (text){
                  tel = text;
                },
              ),
              SizedBox(height: 12),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: Text(
                  "Ok",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () async {
                  await decallRoom();
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ocupRooms()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


