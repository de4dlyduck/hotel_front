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
  late bool occupied;
  late String roomCode;
  late String photo;
  late int id_room;
  String rat='';
  Rooms({
    required this.description,
    required this.cost,
    required this.personScore,
    required this.vans,
    required this.bedScore,
    required this.occupied,
    required this.roomCode,
    required this.photo,
    required this.id_room
  });

  factory Rooms.fromJson(Map<String, dynamic> json){
    return Rooms(
        description: json['description'] as String,
        cost: json['cost'] as double,
        personScore: json['personScore'] as int,
        vans: json['vans'] as int,
        bedScore: json['bedScore'] as int,
        occupied: json['occupied'] as bool,
        roomCode: json['roomCode'] as String,
        photo: json['photo'] as String,
        id_room: json['id'] as int
    );
  }
  Map toJson()=>
      {
       'description':description,
       'cost':cost,
       'personScore':personScore,
       'vans':vans,
       'bedScore':bedScore,
       'occupied':occupied,
       'roomCode':roomCode,
       'photo':photo,
      };
}



class Profiles {
    late String name;
    late String surname;
    late String patronymic;
    late String password;
    late String serial;
    late String nomber;
    late String mail;
    late String telNumber;
    late String type;

  Profiles({
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.password,
    required this.serial,
    required this.nomber,
    required this.mail,
    required this.telNumber,
    required this.type
  });

  factory Profiles.fromJson(Map<String, dynamic> json){
    return Profiles(
        name: json['name'] as String,
        surname: json['surname'] as String,
        patronymic: json['patronymic'] as String,
        password: json['password'] as String,
        serial: json['serial'] as String,
        nomber: json['nomber'] as String,
        mail: json['mail'] as String,
        telNumber: json['telNumber'] as String,
        type: json['role'] as String);
  }
  Map toJson()=>
      {
        'name': name,
        'surname': surname,
        'patronymic': patronymic,
        'password': password,
        'serial': serial,
        'nomber': nomber,
        'mail': mail,
        'telNumber': telNumber,
        'type': type
      };
}


class Penalties {
  late double cost;
  late String description;
  late int id_user;
  late int id_penal;
  Penalties({
    required this.description,
    required this.cost,
    required this.id_penal
  });

  factory Penalties.fromJson(Map<String, dynamic> json){
    return Penalties(
        description: json['description'] as String,
        id_penal: json['id'] as int,
        cost: json['cost'] as double);
  }
  Map toJson()=>
      {
        'cost': cost,
        'id_user': id_user,
        'description': description
      };
}

class Reviews{

  late String description;
  late int rating;
  late int id_rooms;
  late String Name_profile;
  late int id_profile;
  Reviews(
  {
    required this.description,
    required this.id_rooms,
    required this.rating,
    required this.id_profile,
    required this.Name_profile

  }
      );

  factory Reviews.fromJson(Map<String, dynamic> json){
    return Reviews(
        description: json['description'] as String,
        rating: json['rating'] as int,
        id_rooms: json['id_rooms'] as int,
        id_profile: json['Name_profile'] as int,
        Name_profile: json['name'] as String
    );
  }
  Map toJson()=>
      {
        'rating': rating,
        'id_profile': id_profile,
        'description': description,
        'id_rooms':id_rooms
      };

}


class Date{
  late int id;
  late int id_room;
  late String first_day;
  late String last_day;
  late String code;

  Date({required this.id,
    required this.id_room,
    required this.first_day,
    required this.last_day,
    required this.code
  });


  factory Date.fromJson(Map<String, dynamic> json){
    return Date(
      id: json['id'] as int,
      id_room: json['id_room'] as int,
      first_day: json['first_day'] as String,
      last_day: json['last_day'] as String,
      code: json['code'] as String
    );
  }


  Map toJson()=>
      {
        'id': id,
        'id_room': id_room,
        'first_day':first_day,
        'last_day':last_day
      };


}




