import 'package:hotel_front/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/profile.dart';
var cont;

class regPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _regPage();
}

class _regPage extends State<regPage> {
  @override
  Widget build(BuildContext context) {
    cont = context;
    return Scaffold(
      drawer: navigationBarside(),
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            buildUserInfoDisplay('', 'Введите имя:'),
            buildUserInfoDisplay('', 'Введите фамилию:'),
            buildUserInfoDisplay('', 'Введите отчество:'),
            buildUserInfoDisplay('', 'Введите серию паспорта:'),
            buildUserInfoDisplay('', 'Введите номер паспорта:'),
            buildUserInfoDisplay('', 'Введите почту:'),
            buildUserInfoDisplay('', 'Введите телефон:'),
            buildUserInfoDisplay('', 'Введите пароль:'),
            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Зарегистрироваться",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}

