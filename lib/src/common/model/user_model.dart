import 'package:flutter/foundation.dart';
import 'product_model.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? sex;
  final String? email;
  final double lon;
  final double lat;
  List<RestaurantProducts>? korzinka = [];

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.lon,
    required this.lat,
    this.korzinka,
    this.email,
    this.sex,
  });

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.sex == sex &&
        other.email == email &&
        other.lon == lon &&
        other.lat == lat &&
        listEquals(other.korzinka, korzinka);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        sex.hashCode ^
        email.hashCode ^
        lon.hashCode ^
        lat.hashCode ^
        korzinka.hashCode;
  }
}
