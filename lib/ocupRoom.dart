import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/navigationBarAdmin.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

late List<Profiles> RdateProfileUs;

Future<void> decProfileTel() async {
  final response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/hotel/nameTel/${tel}"));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  RdateProfileUs =
      json.map((e) => Profiles.fromJson(e as Map<String, dynamic>)).toList();
}


class ocupRooms extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ocupCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ocupCard extends StatelessWidget {
  const ocupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarsideAdmin(),
      appBar: AppBar(
        title: Text("Ваши номера"),
      ),
      backgroundColor: Colors.indigo,
      body: ListView.builder(
          itemCount: RdateallRoom.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Ваш номер'),
                      subtitle: Text('${RdateallRoom[index].first_day}/${RdateallRoom[index].last_day}'),
                      trailing: TextButton.icon(
                        label: Text(des().desrati(RdateallRoom[index].id_room)),
                        icon: Icon(Icons.star),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ratingHotel(id_room: RdateallRoom[index].id_room,)));
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
                      child: Text(des().desc(RdateallRoom[index].id_room)),
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
                        ),
                        TextButton(
                          child: const Text('ИНФОРМАЦИЯ О ПОЛЬЗОВАТЕЛЕ'),
                          onPressed: () async {
                            await decProfileTel();
                            showDialog(context: context, builder:(context)=>showProfile());

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
        child: Text(RdateallRoom[idMyRoom].code.toString()),
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

class showProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child:Text("Профиль гостя")),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('Имя:'+RdateProfileUs[0].name.toString()),
            SizedBox(height: 12),
            Text('Фамилия:'+RdateProfileUs[0].surname.toString()),
            SizedBox(height: 12),
            Text('Отчетво:'+RdateProfileUs[0].patronymic.toString()),
            SizedBox(height: 12),
            Text('Серия:'+RdateProfileUs[0].serial.toString()),
            SizedBox(height: 12),
            Text('Номер:'+RdateProfileUs[0].nomber.toString()),
            SizedBox(height: 12),
            Text('Телефон:'+RdateProfileUs[0].telNumber.toString())
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}

