import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/myRooms.dart';
import 'package:hotel_front/balance.dart';
import 'package:hotel_front/profile.dart';
import 'package:hotel_front/room.dart';



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
            child: Text(
              RdateProfile[0].name.toString() + " " +
                  RdateProfile[0].surname.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text("Номера"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => roomPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Профиль"),
            onTap: () async {
              await decProfile();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.meeting_room_outlined),
            title: Text("Мои номера"),
            onTap: () async {
              await decMyRoom();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyRooms()));
            },
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Штрафы"),
            onTap: () async {
              await decPenalties();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => balancePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
            onTap: () {
              showDialog(context: context, builder: (context) => exit()).then((
                  e) {
                if (id==0) {
                  RdateProfile.clear();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => logPage()));
                }
              });
            },
          ),
        ],
      ),
    );
  }
}


class exit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Вы точно хотите выйти"),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              id=0;
              Navigator.of(context).pop();
            },
            child: const Text("Да")),
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Нет"))
      ],
    );
  }

}



