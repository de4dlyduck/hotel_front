import 'package:flutter/material.dart';
import 'package:hotel_front/navigationBar.dart';
import 'package:hotel_front/login.dart';

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
            buildUserInfoDisplay('Вадим', 'Имя:'),
            buildUserInfoDisplay('Големин', 'Фамилия:'),
            buildUserInfoDisplay('Андреев', 'Отчество:'),
            buildUserInfoDisplay('1516', 'Серия паспорта:'),
            buildUserInfoDisplay('1337228', 'Номер паспорта:'),
            buildUserInfoDisplay('123@mail.ru', 'Почта:'),
            buildUserInfoDisplay('8800355355', 'Телефон:'),
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
              onTap: (){showDialog(context: context, builder: (context)=> login());},
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildUserInfoDisplay(String getValue, String title) =>
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
                                builder: (context) => newInfo(), context: cont);
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
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class newPassword extends StatelessWidget {
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
                  labelText: 'Введите новый пароль',
                ),
              ),
              SizedBox(height: 15),
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
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
