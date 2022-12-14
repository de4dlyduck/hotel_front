import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

late int ind;
late List<Date> RdateMyRoom;

Future<void> decMyRoom() async {
  final response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/hotel/UserRoom/${id}"));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  RdateMyRoom =
      json.map((e) => Date.fromJson(e as Map<String, dynamic>)).toList();

}

class MyRooms extends StatelessWidget {
  const MyRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: myRoomsCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class myRoomsCard extends StatelessWidget {
  const myRoomsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text("Ваши номера"),
      ),
      backgroundColor: Colors.indigo,
      body: ListView.builder(
          itemCount: RdateMyRoom.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Ваш номер'),
                      subtitle: Text('${RdateMyRoom[index].first_day}/${RdateMyRoom[index].last_day}'),
                      trailing: TextButton.icon(
                        label: Text(des().desrati(RdateMyRoom[index].id_room)),
                        icon: Icon(Icons.star),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ratingHotel(id_room: RdateMyRoom[index].id_room,)));
                        },
                      ),
                    ),
                    Container(
                      height: 200.0,
                      child: Ink.image(
                        image: NetworkImage(Rdate[0].photo.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(des().desc(RdateMyRoom[index].id_room)),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('ПЕРСОНАЛЬНЫЙ КОД'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => code(idMyRoom: index,));
                          },
                        )
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}

class code extends StatelessWidget {
  late int idMyRoom;
  code({required this.idMyRoom});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Код доступа"),
      content: SingleChildScrollView(
        child: Text(RdateMyRoom[idMyRoom].code.toString()),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ok"))
      ],
    );
  }
}


class des{
  String desc(int id_room){
    for(int i=0;i<Rdate.length;i++)
      {
        if(Rdate[i].id_room==id_room)
          {
            return Rdate[i].description.toString();
          }
      }
    return 'null';
  }

  String desrati(int id_room){
    for(int i=0;i<Rdate.length;i++)
    {
      if(Rdate[i].id_room==id_room)
      {
        return Rdate[i].rat.toString();
      }
    }
    return 'null';
  }
}
