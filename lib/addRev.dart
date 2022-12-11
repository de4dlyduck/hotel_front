import 'package:flutter/material.dart';
import 'package:hotel_front/models.dart';
import 'package:hotel_front/room.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hotel_front/login.dart';


String description='';
int id_user=0;
int rating=0;




class addRevPage extends StatefulWidget {
  late int id_room;
  addRevPage({required this.id_room});
  @override
  State<StatefulWidget> createState() => _addRevPage(id_room: id_room);
}

class _addRevPage extends State<addRevPage> {
  late int id_room;
  _addRevPage({required this.id_room});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить отзыв'),
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
                      'Введите оценку(от 1 до 5)',
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
                                  rating = int.parse(text);
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
                      'Введите отзыв',
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
                "Добавить",

                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                Reviews rew = new Reviews(description: description, id_rooms: id_room, rating: rating, id_profile: id, Name_profile: '');
                String jsonfile = jsonEncode(rew);
                http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/add/rew'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    }, body: jsonfile).then((value){
                      if(value.body=='error')
                        {
                          showDialog(context: context, builder:(context)=>exitRev());
                        }
                });

                await dec();
                await decRating(id_room);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class exitRev extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Вы уже оставили отзыв"),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Ок"))
      ],
    );
  }

}