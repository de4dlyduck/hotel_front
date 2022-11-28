import 'dart:ffi';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Rooms {
  late String description;
  late double cost;
  late int personScore;
  late int vans;
  late int bedScore;
  late Bool occupied;
  late int idUser;
  late String roomCode;

  Rooms({
    required this.description,
    required this.cost,
    required this.personScore,
    required this.vans,
    required this.bedScore,
    required this.occupied,
    required this.idUser,
    required this.roomCode,
  });

  factory Rooms.fromJson(Map<String, dynamic> json){
    return Rooms(
        description: json['description'] as String,
        cost: json['cost'] as double,
        personScore: json['personScore'] as int,
        vans: json['vans'] as int,
        bedScore: json['bedScore'] as int,
        occupied: json['occupied'] as Bool,
        idUser: json['idUser'] as int,
        roomCode: json['roomCode'] as String);
  }
}


class Roomdecode {
  var url1 = "http://10.0.2.2:5000/hotel/1";
  Future<void> dec() async{
    final response = await http.get(Uri.parse(url1));
    var res = utf8.decode(response.bodyBytes);
    debugPrint("'");
  }
}

