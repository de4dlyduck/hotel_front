import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';

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
          itemCount: 1,
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
                        onPressed: (){
                          showDialog(context: context, builder:(context)=>code());
                        },
                        child: Text("Показать код"),
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

class code extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Код доступа"),
      content: SingleChildScrollView(
        child: Text("R4M5ART"),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Ok"))
      ],
    );
  }

}
