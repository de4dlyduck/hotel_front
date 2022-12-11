import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
              itemCount: RdatePenalties.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(RdatePenalties[index].description.toString()),
                    subtitle: Text("${RdatePenalties[index].cost.toString()} руб"),
                    trailing: TextButton(
                      child: Text("Оплатить"),
                      onPressed: () async {
                        payClass paY = new payClass(id: RdatePenalties[index].id_penal);
                        await paY.pay(paY.id);
                        await decPenalties();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => balancePage()));
                      },
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

class payClass{
  late int id;

  payClass({required this.id});

  Future<void> pay(int id) async {
    await http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/deletPen'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, body: jsonEncode(<String, String>{'id': id.toString()}));
    await decPenalties();
  }
}
