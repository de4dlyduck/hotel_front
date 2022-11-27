import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';

const List<String> rati = <String>["Сначала положительные", "Сначала отрицательные"];
String val = rati[0];
class ratingHotel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ratingHotelCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ratingHotelCard extends StatelessWidget{
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
            {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>ratingHotel()));
              val = newValue!;
            },
          ),
        ],
      ),
      backgroundColor: Colors.indigo,
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Имя:Петр п"),
                    trailing: Text(
                      "Оценка:4.5",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Ну такоe, конечно получше будет"),
                  )
                ],
              ),
            );
          }),
    );
  }

}