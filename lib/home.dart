import 'package:flutter/material.dart';
import 'package:hotel_front/room.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_front/login.dart';

const int log =1;

const List<String> city = <String>["Москва", "СПБ", "Калуга"];
String val = city[0];


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: hotelCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class hotelCard extends StatelessWidget {
  const hotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text("Выберете город:"),

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
            onChanged:
                (String? newValue)
            {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
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
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text("У берега"),
                    trailing: TextButton.icon(
                      label: Text("4.5"),
                      icon: Icon(Icons.star),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ratingHotel()));
                      },
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.network(
                        "https://ak-d.tripcdn.com/images/22090f0000007kt4e1864.jpg"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 40,
                    child: Text("цена за сутки:4500 руб"),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>roomPage()));
                        },
                        child: Text("Подробнее"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          showDialog(context: context, builder:(context)=>login());
                        },
                        child: Text("Акк"),
                      ),

                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
