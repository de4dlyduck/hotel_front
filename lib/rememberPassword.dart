import 'package:flutter/material.dart';
import 'package:hotel_front/login.dart';
import 'package:hotel_front/reg.dart';
import 'package:http/http.dart' as http;


String email='';


class remember extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _reemberPage();
}



class _reemberPage extends State<remember> {
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


                SizedBox(height: 20),

                ListTile(
                  tileColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(
                    "Отправить новый пароль",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    
                    http.get(Uri.parse("http://10.0.2.2:5000/api/hotel/remember/${email}"));
                    showDialog(context: context, builder:(context)=>pushEmall());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => logPage()));
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

class pushEmall extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Новый пароль был отправлен вам на почту"),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Да")),
      ],
    );
  }

}

