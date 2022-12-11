import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/addRev.dart';
import 'package:http/http.dart' as http;
import 'package:hotel_front/room.dart';
import 'dart:convert';
import 'dart:async';




const List<String> rati = <String>["Сначала положительные", "Сначала отрицательные"];
String val = rati[0];
class ratingHotel extends StatelessWidget{
  late int id_room;
  ratingHotel({required this.id_room});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ratingHotelCard(id_room: id_room,),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ratingHotelCard extends StatelessWidget{
  late int id_room;
  ratingHotelCard({required this.id_room});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text("Отзывы:"),
        actions: [
          DropdownButton(
            value: val,
            icon: Icon(Icons.keyboard_arrow_down),
            items: rati.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue)
            async {
              if(newValue==rati[0])
                {
                  Urlrat='http://10.0.2.2:5000/api/hotel/rating/all/1/';
                }
              else{
              Urlrat='http://10.0.2.2:5000/api/hotel/rating/all/2/';
              }
              await decRating(id_room);
              Navigator.push(context, MaterialPageRoute(builder:(context)=>ratingHotel(id_room: id_room,)));
              val = newValue!;
            },
          ),
        ],
      ),
      backgroundColor: Colors.indigo,
      body: ListView.builder(
            itemCount: RdateRating.length+1,
            itemBuilder: (BuildContext context, int index) {

              if(index==0)
                {
                  return Card(
                    margin: EdgeInsets.all(20.0),
                    child: IconButton(onPressed: (){
                      showDialog(context: context, builder: (context)=>addRevPage(id_room: id_room));
                    },icon: Icon(Icons.add),),
                  );
                }
              else
                {
                return Card(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Имя:${RdateRating[index-1].Name_profile}"),
                        trailing: Text(
                          "Оценка:${RdateRating[index-1].rating}",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(RdateRating[index-1].description.toString()),
                      )
                    ],
                  ),
                );
              }
              },
        ),
      );
  }

}