import 'package:flutter/material.dart';
import 'package:hotel_front/reg.dart';

class logPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _logPage();
}

class _logPage extends State<logPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 250, 20, 0),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите emall',
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
                              child: TextField(
                            style: TextStyle(
                                fontSize: 20, height: 1.4, color: Colors.white),
                                onSubmitted: (text){

                                },
                          )),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]))
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Введите пароль',
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
                              child: TextField(
                            style: TextStyle(
                                fontSize: 20, height: 1.4, color: Colors.white),
                                onSubmitted: (text){

                                },
                          )),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]))
                  ],
                )),

            ListTile(
              tileColor: Colors.indigo,
              title: Text(
                "Не помню пароль",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Войти",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            SizedBox(height: 20),

            ListTile(
              tileColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Зарегистироваться",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => regPage()));
              },
            ),

          ],
        ),
      ),
    );
  }
}
