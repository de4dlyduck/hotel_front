// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> choose = <String>["Дешевле", "Дороже"];
String val = choose[0];

String Urlrat='http://10.0.2.2:5000/api/hotel/rating/all/1/';

late List<Reviews> RdateRating;

Future<void> decRating(int id_room) async {
  final response = await http.get(Uri.parse(Urlrat+id_room.toString()));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  RdateRating = json.map((e) => Reviews.fromJson(e as Map<String, dynamic>)).toList();
}

class roomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => roomCard();
}

class roomCard extends State<roomPage> {



  String? _value;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {dec();});
    dec().then((_value){
      setState(() {
        _value = "result";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: navigationBarside(),
        appBar: AppBar(
          title: Text("Номера"),
        ),
        backgroundColor: Colors.indigo,
        body: ListView.builder(
            itemCount: Rdate.length+1,
            itemBuilder: (BuildContext context, int index) {
              if(index==0){
                return ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){url1 = "http://10.0.2.2:5000/hotel/1"; Navigator.push(context, MaterialPageRoute(builder: (context) => roomPage())); }, child: Text("Сначала дешевле",style: TextStyle(color: Colors.black),), style:TextButton.styleFrom(fixedSize: const Size(182, 40), backgroundColor: Colors.white)),
                    TextButton(onPressed: (){url1 = "http://10.0.2.2:5000/hotel/2"; Navigator.push(context, MaterialPageRoute(builder: (context) => roomPage())); }, child: Text("Сначала дороже", style: TextStyle(color: Colors.black),), style:TextButton.styleFrom(fixedSize: const Size(182, 40), backgroundColor: Colors.white)),
                  ],
                );
              }
              else {
                heading = '${Rdate[index-1].cost.toString()} руб за сутки';
                subheading =
                '${Rdate[index-1].bedScore.toString()} кровати, ${Rdate[index-1]
                    .vans.toString()} ванная';
                supportingText =
                'Описание: ${Rdate[index-1].description.toString()}';
                photo=Rdate[index-1].photo.toString();
                return Card(
                  key: ValueKey(index),
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(heading),
                        subtitle: Text(subheading),
                        trailing: TextButton.icon(
                          label: Text(Rdate[index-1].rat),
                          icon: Icon(Icons.star),
                          onPressed: () async {
                            await decRating(Rdate[index-1].id_room,);
                            showDialog(context: context, builder:(context)=>ratingHotel(id_room: Rdate[index-1].id_room,));
                          },
                        ),
                      ),
                      Container(
                        height: 200.0,
                        child: Ink.image(
                          image: NetworkImage(photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(supportingText),
                      ),
                      ButtonBar(
                        children: [
                          TextButton(
                            child: const Text('СНЯТЬ'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => takeOffDate(cost: Rdate[index-1].cost, id_room: Rdate[index-1].id_room,));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}

class takeOffDate extends StatefulWidget {
  late double cost;
  late int id_room;
  takeOffDate({super.key, required this.cost, required this.id_room});
  @override
  State<StatefulWidget> createState() => _takeOff(costUser: cost, id_room: id_room);
}

class _takeOff extends State<takeOffDate> {
  late int id_room;
  late double costUser;
  var firt_day;
  var last_day;
  _takeOff({required this.costUser, required this.id_room});
  late DateTimeRange result;
  String date = 'Выберите даты';
  String datecost = 'Цена:';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        datecost,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(300, 50),
            ),
            onPressed: () async {
              result = (await showDateRangePicker(
                  context: context,
                  currentDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
                  firstDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
                  lastDate: DateTime(DateTime.now().year,DateTime.now().month+1,DateTime.now().day)))!;
              if (result != null) {
                setState(() {
                  var dateT = DateTime.parse(result.start.toString());
                  firt_day = dateT;
                  date = "${dateT.day}-${dateT.month}-${dateT.year}";
                  date += '/';
                  dateT = DateTime.parse(result.end.toString());
                  last_day = dateT;
                  date += "${dateT.day}-${dateT.month}-${dateT.year}";
                  int cost;
                  cost = 0;
                  datecost = 'Цена:';
                  cost = result.duration.inDays.toInt() * costUser.toInt();
                  datecost += cost.toString();
                  datecost += ' Руб';
                });
              }
            },
            child: Text(date)),
        TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(300, 50),
            ),
            onPressed: () async {
              Date payday= new Date(id: id, id_room: id_room, first_day: firt_day.toString().substring(0,firt_day.toString().indexOf(" ")), last_day: last_day.toString().substring(0,last_day.toString().indexOf(" ")), code: "");
              String jsonfile = jsonEncode(payday.toJson());
              await http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/payRoom'),headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              }, body: jsonfile).then((value){
                if(value.body=='error')
                  {
                    setState(() {
                      datecost='Номер на эти даты уже занят';
                    });
                  }
              });
            },
            child: Text('Снять')),
      ],
    );
  }
}


