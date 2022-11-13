import 'package:flutter/material.dart';
import 'package:hotel_front/myRooms.dart';


class navigationBarside extends StatelessWidget {
  navigationBarside({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child:Text(
                "Вадим Големин",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Профиль"),
          ),
          ListTile(
            leading: Icon(Icons.meeting_room_outlined),
            title: Text("Мои номера"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>MyRooms()));
            },
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Баланс:5300 руб"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Обратная свзять"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
          ),

        ],
      ),
    );
  }
}



