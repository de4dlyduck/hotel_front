import 'package:flutter/material.dart';
import 'package:hotel_front/models.dart';
import 'package:hotel_front/profileAdmin.dart';
import 'package:hotel_front/reg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class regPageAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _regPageAd();
}

String emall='';
String nomber = '';
String password= '';

class _regPageAd extends State<regPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите почту',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ))),
                        child: Row(children: [
                          Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 20, height: 1.4, color: Colors.white),
                                onSubmitted: (text){
                                  emall = text;
                                },
                              )),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите телефон',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ))),
                        child: Row(children: [
                          Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 20, height: 1.4, color: Colors.white),
                                onSubmitted: (text){
                                  nomber=text;
                                },
                              )),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите пароль',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ))),
                        child: Row(children: [
                          Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 20, height: 1.4, color: Colors.white),
                                onSubmitted: (text){
                                  password=text;
                                },
                              )),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]))
                  ],
                )),
            SizedBox(height: 15,),
            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Зарегистрироваться",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                Profiles prof = new Profiles(name: '', surname: '', patronymic: '', password: password, serial: '', nomber: '', mail: emall, telNumber: nomber, type: 'admin');
                String Jsonfile = jsonEncode(prof);
                http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/reg/admin'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    }, body: Jsonfile).then((value){
                      if(value.body=='Success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => profilePageAdmin()));
                      }
                      else
                        {
                          showDialog(context: context, builder: (context)=>codeError());
                        }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

