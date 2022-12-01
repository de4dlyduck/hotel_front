import 'dart:ffi';
import 'dart:convert';
import 'dart:async';
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



class Profiles {
  late String name;
  late String surname;
  late String patronymic;
  late String password;
  late int serial;
  late int nomber;
  late String mail;
  late int telNumber;

  Profiles({
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.password,
    required this.serial,
    required this.nomber,
    required this.mail,
    required this.telNumber,
  });

  factory Profiles.fromJson(Map<String, dynamic> json){
    return Profiles(
        name: json['name'] as String,
        surname: json['surname'] as String,
        patronymic: json['patronymic'] as String,
        password: json['vans'] as String,
        serial: json['bedScore'] as int,
        nomber: json['occupied'] as int,
        mail: json['idUser'] as String,
        telNumber: json['roomCode'] as int);
  }
}




