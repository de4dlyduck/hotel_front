import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/models.dart';
import 'dart:convert';

const List<String> choose = <String>["Дешевле", "Дороже"];
String val = choose[0];
late String heading;
late String subheading;
var result = [];
var cardImage = NetworkImage('https://sovcominvest.ru/uploads/photo/6921/image/4e6b21d8254ef3e176bd0837a24efad8.jpg');
late String supportingText;



class roomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => roomCard();
}

class roomCard extends State<roomPage> {

  void takeData(){
    Roomdecode Rdecode = Roomdecode();
    final json = jsonDecode(Rdecode.dec().toString()) as List<dynamic>;
    final res = json.map((e) => Rooms.fromJson(e as Map<String, dynamic>)).toList();
    setState(() {
      result = res;
    });
  }

  @override
  void initState() {
    super.initState();
    takeData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: navigationBarside(),
        appBar: AppBar(
          title: Text("Сначала:"),
          actions: [
            DropdownButton(
              value: val,
              icon: Icon(Icons.keyboard_arrow_down),
              items: choose.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                val = newValue!;
              },
            ),
          ],
        ),
        backgroundColor: Colors.indigo,
        body: ListView.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index) {
              heading = '';
              subheading='';
              supportingText='';
              subheading += result[index].bedScore.toString();
              subheading += 'кровати, ';
              subheading += result[index].vans.toString();
              subheading += 'ванная';
              heading += result[index].cost.toString();
              heading += ' руб за сутки';
              supportingText += 'Описание:';
              supportingText += result[index].description.toString();
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
                  ));
            }),
      ),
    );
    throw UnimplementedError();
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
