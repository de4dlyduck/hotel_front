import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';

class balancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: balanceCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class balanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text(
          "Баланс",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Задолжности",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text("Мелкие поломки"),
                    trailing: TextButton(
                      child: Text("Оплатить"),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
