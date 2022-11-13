import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';




const List<String> city = <String>["Дешевле", "Дороже"];
String val = city[0];


class roomPage extends StatelessWidget {
  const roomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder()
          }
        )
      ),
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
            onChanged:
                (String? newValue)
            {
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
                        onPressed: () {},
                        child: Text("Снять"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
    throw UnimplementedError();
  }
}
