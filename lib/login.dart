import 'package:flutter/material.dart';
import 'package:hotel_front/profile.dart';
import 'package:hotel_front/reg.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 370,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Вход',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя пользователя',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (context)=> remember1());
                  //forgot password screen
                },
                child: const Text(
                  'Вспомнить пароль',
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Войти'),
                    onPressed: () {},
                  )),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Регистрация'),
                    onPressed: () {showDialog(context: context, builder: (context)=> regPage());},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class remember1 extends StatelessWidget {
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
                  labelText: 'Введите свою почту',
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
                  "Далее",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showDialog(context: context, builder: (context)=> remember2());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class remember2 extends StatelessWidget {
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
                  labelText: 'Введите проверочный код отправленный на почту',
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
                  "Далее",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showDialog(context: context, builder: (context)=> newPassword());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}