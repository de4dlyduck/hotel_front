import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel_front/models.dart';
import 'package:hotel_front/reg.dart';
import 'package:hotel_front/room.dart';
import 'package:hotel_front/rememberPassword.dart';
import 'package:hotel_front/roomAdmin.dart';
import 'package:http/http.dart' as http;


String email='';
String passw = '';
late int id;
late String heading;
late String subheading;
late  String photo;
late String supportingText;
late List<Rooms> Rdate;
late List<Profiles> RdateProfile;
late List<Penalties> RdatePenalties;
var url1 = "http://10.0.2.2:5000/hotel/1";
var url2 = "http://10.0.2.2:5000/hotel/admin/1";


Future<void> decAdmin() async {
  final response = await http.get(Uri.parse(url2));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  Rdate = json.map((e) => Rooms.fromJson(e as Map<String, dynamic>)).toList();
  for(int i=0;i<Rdate.length;i++)
  {
    await http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/rating/${Rdate[i].id_room}')).then((resp){
      if(resp.body.toString().length>3)
      {
        Rdate[i].rat=resp.body.toString().substring(0,3);
      }
      else
      {
        Rdate[i].rat=resp.body.toString();
      }

    });
  }
}


Future<void> dec() async {
  final response = await http.get(Uri.parse(url1));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  Rdate = json.map((e) => Rooms.fromJson(e as Map<String, dynamic>)).toList();
  for(int i=0;i<Rdate.length;i++)
    {
      await http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/rating/${Rdate[i].id_room}')).then((resp){
        if(resp.body.toString().length>3)
          {
            Rdate[i].rat=resp.body.toString().substring(0,3);
          }
        else
          {
            Rdate[i].rat=resp.body.toString();
          }
      
      });
    }
}

Future<void> decProfile() async {
  final response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/hotel/name/${id}"));
  String res = utf8.decode(response.bodyBytes);
  final json = jsonDecode(res) as List<dynamic>;
  RdateProfile =
      json.map((e) => Profiles.fromJson(e as Map<String, dynamic>)).toList();
}



  Future<void> decPenalties() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/api/hotel/penalties/${RdateProfile[0].telNumber}"));
    String res = utf8.decode(response.bodyBytes);
    final json = jsonDecode(res) as List<dynamic>;
    RdatePenalties = json.map((e) => Penalties.fromJson(e as Map<String, dynamic>)).toList();
  }




class logPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _logPage();
}



class _logPage extends State<logPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
      builder:(context)=> Scaffold(
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
                              email=text;
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
                              passw = text;
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>remember()));
              },
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
              onTap: () {
                http.post(Uri.parse('http://10.0.2.2:5000/api/hotel/log'),headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'email': email, 'password': passw,})).then((response) async {
                  if(response.body=='Error')
                    {
                      showDialog(context: context, builder:(context)=>  codeError());
                    }
                  else
                    {
                      String buf = response.body;
                      id=int.parse(buf.substring(7));
                      await decProfile();
                      await decPenalties();
                      if(RdateProfile[0].name!='') {
                        await dec();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => roomPage()));
                        email = '';
                        passw = '';
                      }
                      else{
                        await decAdmin();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => roomPageAdmin()));
                      }

                    }
                });

              },
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => regPage()));
              },
            ),

          ],
        ),
      ),
      ),
    ),
    );
  }
}
