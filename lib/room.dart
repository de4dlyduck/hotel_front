import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/rating.dart';

const List<String> city = <String>["Дешевле", "Дороже"];
String val = city[0];
var heading = '2300 руб за сутки';
var subheading = '2 кровати, 1 ванная';
var cardImage = NetworkImage(
    'https://sovcominvest.ru/uploads/photo/6921/image/4e6b21d8254ef3e176bd0837a24efad8.jpg');
var supportingText = 'Описание:';
DateTime curent = DateTime(2022);

class roomPage extends StatelessWidget {
  const roomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder()
      })),
      home: roomCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class roomCard extends StatelessWidget {
  roomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text("Сначала:"),
        actions: [
          DropdownButton(
            value: val,
            icon: Icon(Icons.keyboard_arrow_down),
            items: city.map((String items) {
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
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
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
                  cost =0;
                  datecost = 'Цена:';
                  cost = result.duration.inDays.toInt()*2300;
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
