// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';

import 'product_model.dart';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? sex;
  final String? email;
  final double lon;
  final double lat;
  List<RestaurantProducts>? korzinka;
  List<RestaurantProducts>? history;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.sex,
    this.email,
    required this.lon,
    required this.lat,
    this.korzinka,
    this.history,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'email': email,
      'lon': lon,
      'lat': lat,
      'korzinka': _encodeListToJson(korzinka),
      'history': _encodeListToJson(history),
    };
  }

  String _encodeListToJson(List<RestaurantProducts>? list) {
    if (list == null) {
      return '[]';
    }
    return jsonEncode(list.map((item) => item.toMap()).toList());
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.sex == sex &&
        other.email == email &&
        other.lon == lon &&
        other.lat == lat &&
        listEquals(other.korzinka, korzinka) &&
        listEquals(other.history, history);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        sex.hashCode ^
        email.hashCode ^
        lon.hashCode ^
        lat.hashCode ^
        korzinka.hashCode ^
        history.hashCode;
  }

  

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, sex: $sex, email: $email, lon: $lon, lat: $lat, korzinka: $korzinka, history: $history)';
  }
}
