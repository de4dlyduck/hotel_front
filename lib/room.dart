// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> choose = <String>["Дешевле", "Дороже"];
String val = choose[0];
late String heading;
late String subheading;
var cardImage = NetworkImage(
    'https://sovcominvest.ru/uploads/photo/6921/image/4e6b21d8254ef3e176bd0837a24efad8.jpg');
late String supportingText;
late List<Rooms> Rdate;
var url1 = "http://10.0.2.2:5000/hotel/1";

Future<void> dec() async {
  final response = await http.get(Uri.parse(url1));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  Rdate = json.map((e) => Rooms.fromJson(e as Map<String, dynamic>)).toList();
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
                return Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(heading),
                        subtitle: Text(subheading),
                        trailing: TextButton.icon(
                          label: Text("4.5"),
                          icon: Icon(Icons.star),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ratingHotel()));
                          },
                        ),
                      ),
                      Container(
                        height: 200.0,
                        child: Ink.image(
                          image: cardImage,
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
                                  builder: (context) => takeOffDate());
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
  @override
  State<StatefulWidget> createState() => _takeOff();
}

class _takeOff extends State<takeOffDate> {
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
                  currentDate: DateTime(2021),
                  firstDate: DateTime(2020, 8),
                  lastDate: DateTime(2022)))!;
              if (result != null) {
                setState(() {
                  var dateT = DateTime.parse(result.start.toString());
                  date = "${dateT.day}-${dateT.month}-${dateT.year}";
                  date += '/';
                  dateT = DateTime.parse(result.end.toString());
                  date += "${dateT.day}-${dateT.month}-${dateT.year}";
                  int cost;
                  cost = 0;
                  datecost = 'Цена:';
                  cost = result.duration.inDays.toInt() * 2300;
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
            onPressed: () {},
            child: Text('Снять')),
      ],
    );
  }
}
