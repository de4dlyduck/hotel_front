// ignore_for_file: camel_case_types
import 'package:hotel_front/addRoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/rating.dart';
import 'package:hotel_front/navigationBarAdmin.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/room.dart';
import 'package:hotel_front/refresh.dart';
import 'package:http/http.dart' as http;


const List<String> choose = <String>["Дешевле", "Дороже"];
String val = choose[0];

class roomPageAdmin extends StatefulWidget {
  const roomPageAdmin({super.key});

  @override
  State<StatefulWidget> createState() => roomCardAd();
}

class roomCardAd extends State<roomPageAdmin> {

  String? _value;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      decAdmin();
    });
    decAdmin().then((_value) {
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
        drawer: navigationBarsideAdmin(),
        appBar: AppBar(
          title: Text("Номера"),
        ),
        backgroundColor: Colors.indigo,
        body: ListView.builder(
            itemCount: Rdate.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addRoomPage()));
                        },
                        child: Text(
                          "Добавить новый номер",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white)),
                  ],
                );
              } else {
                heading = '${Rdate[index - 1].cost.toString()} руб за сутки';
                subheading =
                '${Rdate[index - 1].bedScore
                    .toString()} кровати, ${Rdate[index - 1]
                    .vans.toString()} ванная';
                supportingText =
                'Описание: ${Rdate[index - 1].description.toString()}';
                photo = Rdate[index - 1].photo.toString();
                return Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(heading),
                        subtitle: Text(subheading),
                        trailing: TextButton.icon(
                          label: Text(Rdate[index - 1].rat),
                          icon: Icon(Icons.star),
                          onPressed: () async {
                            await decRating(Rdate[index - 1].id_room);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ratingHotel(
                                          id_room: Rdate[index - 1].id_room,)));
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
                            child: Text(switc().out(Rdate[index-1].occupied)),
                            onPressed: () {
                              
                              if(Rdate[index-1].occupied==false)
                                {
                                  decAdmin();
                              http.post(Uri.parse(
                                  'http://10.0.2.2:5000/api/hotel/ignore/${Rdate[index -
                                      1].id_room}'));
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => roomPageAdmin()));
                                }
                              else
                                {
                                  decAdmin();
                                  http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/deignore/${Rdate[index - 1].id_room}'));
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => roomPageAdmin()));
                                }
                            },
                          ),
                          TextButton(
                            child: const Text('ОБНОВИТЬ ИНФОРМАЦИЮ'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => refRoomPage(idRoom: Rdate[index-1].id_room));
                            },
                          ),
                          TextButton(
                              child: const Text('Удалить',
                                style: TextStyle(color: Colors.red),),
                              onPressed: () async {
                                await http.post(Uri.parse(
                                    'http://10.0.2.2:5000/api/hotel/delete/${Rdate[index -
                                        1].id_room}'));
                                await decAdmin();
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => roomPageAdmin()));
                              }
                          ),
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

class switc {
  late String swit;

  String out(bool sw) {
    if (sw == false) {
      swit = 'CНЯТЬ НОМЕР С ПУБЛИКАЦИИ';
    }
    else {
      swit = 'ОПУБЛИКОВАТЬ НОМЕР';
    }
    return swit;
  }
}