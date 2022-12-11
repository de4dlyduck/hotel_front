import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_front/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String description='';
double cost=0;
int id_user=0;

class addPagePenat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _addPagePenat();
}

class _addPagePenat extends State<addPagePenat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить штраф'),
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 130, 20, 0),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите название штрафа',
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
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите телефон гостя',
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
                                  id_user=int.parse(text);
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
                Penalties penal = new Penalties(description: description, cost: cost, id_penal: 0);
                penal.id_user=id_user;
                String Jsonfile = jsonEncode(penal);
                http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/add/penalties'),
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