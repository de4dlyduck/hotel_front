import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hotel_front/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


String description='';
double cost=0;
int personScore=0;
int vans=0;
int bedScore=0;
bool occupied=false;
int idUser=0;
String roomCode='';
String photoadd='';




class addRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _addRoomPage();
}

class _addRoomPage extends State<addRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить номер'),
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
                      'Введите количсетво кроватей',
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
                                  bedScore = int.parse(text);
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
                      'Введите количетсво ванных',
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
                                  vans=int.parse(text);
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
                      'Введите цену',
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
                                  cost=double.parse(text);
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
                      'Введите максимальное колличество персон',
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
                                  personScore=int.parse(text);
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
                      'Введите дополнительную информацию',
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
                                  description=text;
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
                "Загрузить картинку",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                showDialog(context: context, builder:(context)=>takeimg());

              },
            ),
            SizedBox(height: 15,),
            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Добавить",

                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                Rooms room = new Rooms(description: description, cost: cost, personScore: personScore, vans: vans, bedScore: bedScore, occupied: false, roomCode: roomCode, photo: photoadd, id_room: 0);
                String Jsonfile = jsonEncode(room);
                http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/add/room'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    }, body: Jsonfile);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class takeimg extends StatelessWidget {
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
                  labelText: 'Введите адрес фотографии',
                ),
                onSubmitted: (text){
                  photoadd = text;
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
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
