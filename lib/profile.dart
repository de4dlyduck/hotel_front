import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


var cont;

class profilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _profilePage();
}

class _profilePage extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    cont = context;
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text('Ваш профиль'),
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            buildUserInfoDisplay(RdateProfile[0].name.toString(), 'Имя:',1),
            buildUserInfoDisplay(RdateProfile[0].surname.toString(), 'Фамилия:',2),
            buildUserInfoDisplay(RdateProfile[0].patronymic.toString(), 'Отчество:',3),
            buildUserInfoDisplay(RdateProfile[0].serial.toString(), 'Серия паспорта:',4),
            buildUserInfoDisplay(RdateProfile[0].nomber.toString(), 'Номер паспорта:',5),
            buildUserInfoDisplay(RdateProfile[0].mail.toString(), 'Почта:',6),
            buildUserInfoDisplay(RdateProfile[0].telNumber.toString(), 'Телефон:',7),
            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Сменить пароль",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){showDialog(context: context, builder: (context)=> newInfo(info: 8, id_user: id));},
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildUserInfoDisplay(String getValue, String title, int i) =>
    Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ))),
                child: Row(children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                builder: (context) => newInfo(info: i, id_user: id,), context: cont);
                          },
                          child: Text(
                            getValue,
                            style: TextStyle(
                                fontSize: 20, height: 1.4, color: Colors.white),
                          ))),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 30.0,
                  )
                ]))
          ],
        ));

class newInfo extends StatelessWidget {
  late int info;
  String data='';
  late int id_user;
  newInfo({required this.info, required this.id_user});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 170,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Введите новое значение',
                ),
                onSubmitted: (text){
                  data = text;
                },
              ),
              SizedBox(height: 12),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: Text(
                  "Сохранить",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () async {
                  await http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/update/${info}'),headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'data': data, 'id':id.toString()}));
                  await decProfile();
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>profilePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
