import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/room.dart';
import 'package:hotel_front/rating.dart';

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
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Ваш номер'),
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
                          child: const Text('ПЕРСОНАЛЬНЫЙ КОД'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => code());
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
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Код доступа"),
      content: SingleChildScrollView(
        child: Text("R4M5ART"),
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
