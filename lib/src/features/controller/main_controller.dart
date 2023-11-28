import 'dart:convert';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../common/model/product_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../common/data/database.dart';
import '../../common/model/restaurant_model.dart';
import '../../common/model/user_model.dart';
import '../../common/service/db_service.dart';
import '../../common/styles/app_colors.dart';
import '../../common/utils/custom_extension.dart';
import '../../common/utils/snack_bar.dart';
import '../../common/utils/time_extension.dart';
import '../auth/get_full_name.dart';
import '../auth/sms_cheker.dart';

class MainController extends ChangeNotifier {
  GoogleMapController? mapController;
  double lat = 41.311081;
  double lon = 69.240562;
  String currenAddressName = '';

  /* Get Location */

  void onMapCreated(controller) {
    mapController = controller;
    notifyListeners();
  }

  void getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lat = position.latitude;
      lon = position.longitude;
      getAddressName(lat, lon);
      notifyListeners();
    } catch (error) {
      lat = 41.311081;
      lon = 69.240562;
      getAddressName(lat, lon);
      notifyListeners();
    }
  }

  void mapOnTap(LatLng latLng) {
    lat = latLng.latitude;
    lon = latLng.longitude;
    getAddressName(lat, lon);
    notifyListeners();
  }

  void getAddressName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            "${placemark.subLocality},${placemark.name}, ${placemark.locality}";
        currenAddressName = address;
        notifyListeners();
      } else {
        currenAddressName = "";
        notifyListeners();
      }
    } catch (e) {
      currenAddressName = "";
      notifyListeners();
    }
  }

  /* Get Phone Number */

  String phoneNumber = '';
  String smsCode = '';
  String? numberValidate;
  String? sMSValidate;
  int codeSms = 0;
  int timer = 0;

  void onChanged(String value) => phoneNumber = value;

  void sendSMS() async {
    try {
      codeSms = 100000 + Random().nextInt(999999 - 100000);

      final Uri url =
          Uri.parse(' https://880d-178-218-201-17.ngrok-free.app/email/');
      final Response response = await post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{'number': codeSms}),
      );
      debugPrint(response.body);
    } catch (e) {
      codeSms = 000000;
    }
  }

  void validateNumber(BuildContext context) {
    if (phoneNumber.length == 9) {
      numberValidate = null;
      phoneNumber =
          "${phoneNumber.substring(0, 2)} ${phoneNumber.substring(2, 5)} ${phoneNumber.substring(5, 7)} ${phoneNumber.substring(7)}";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SmsChek(),
        ),
      );
      sendSMS();
    } else {
      numberValidate = 'Неправильный номер';
      notifyListeners();
    }
  }

  /* Sms Cheker */

  void chekSMS(BuildContext context) {
    if (smsCode == '$codeSms') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GetFullName(),
        ),
      );
      notifyListeners();
    } else {
      sMSValidate = 'код неверен';
      notifyListeners();
    }
  }

  void validateSms(String value) {
    if (value == '$sMSValidate' && value.length == 6) {
      sMSValidate = null;
      notifyListeners();
    } else {
      sMSValidate = 'код неверен';
      notifyListeners();
    }
  }

  void time() async {
    for (int i = 30; i > -1; i--) {
      await Future.delayed(const Duration(seconds: 1));
      timer = i;
      notifyListeners();
    }
    codeSms = -1;
  }

  void reSend(BuildContext context) {
    if (timer == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SmsChek(),
        ),
      );
      sendSMS();
    }
  }

  /* Get Full Name */

  String lastName = '';
  String firstName = '';
  String? validateLastName;
  String? validateFirstName;
  late UserModel user;

  void validatorLastName() {
    if (lastName.trim().isEmpty) {
      validateLastName = 'Пожалуйста, укажите фамилию';
      notifyListeners();
    } else {
      validateLastName = null;
      notifyListeners();
    }
  }

  void validatorFirstName() {
    if (firstName.trim().isEmpty) {
      validateFirstName = 'Пожалуйста, укажите имя';
      notifyListeners();
    } else {
      validateFirstName = null;
      notifyListeners();
    }
  }

  void goHomePage(VoidCallback navigateToMainScreen) async {
    if (lastName.trim().isNotEmpty && firstName.trim().isNotEmpty) {
      List<UserModel> dbUsers = await DBService.getAllUsers();
      print(123456789876546);
      print(dbUsers);
      print(123456789876546);

      if (dbUsers.isNotEmpty) {
        UserModel existingUser;
        try {
          existingUser =
              dbUsers.firstWhere((person) => person.phoneNumber == phoneNumber);
          user = UserModel(
            id: existingUser.id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: existingUser.phoneNumber,
            lon: existingUser.lon,
            lat: existingUser.lat,
            email: '',
            history: [],
            korzinka: existingUser.korzinka,
            sex: '',
          );
          productPrice();
        } catch (e, s) {
          print(
              "=-=-=-=-=-=-=-as=d-asd=-asd=-asd=-asd=-asd=-=-=-=-=-=-=-=-as=d-asd=-asd=-asd=-asd=-asd=-=-=-=-=-=-=-=-as=d-asd=-asd=-asd=-asd=-asd=-=-=-=-=-=-=-=-as=d-asd=-asd=-asd=-asd=-asd=-");
          print(e);
          print(s);
          user = UserModel(
            id: dbUsers.last.id + 1,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            lon: lon,
            lat: lat,
            email: '',
            history: [],
            korzinka: [],
            sex: '',
          );
          DBService.addUser(user);
        }
      } else {
        user = UserModel(
          id: 1,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          lon: lon,
          lat: lat,
        );
        DBService.addUser(user);
      }

      // Use the callback to navigate
      navigateToMainScreen();
    } else {
      validatorFirstName();
      validatorLastName();
      notifyListeners();
    }
  }

  /// ***********************Home Page ****************************************

  /* Profile */

  DateTime? selectedDate = DateTime.now();
  String? changeNameValidate;
  String? newName;
  String date = '';
  String newSex = 'Мужской';
  String newEmail = "";
  String? changeEmailVailidate;
  TextEditingController? nameController;
  TextEditingController? dateController;
  TextEditingController? sexController;
  TextEditingController? emailController;
  bool isEmail = false;
  bool isSMS = false;
  void emailSwitch() {
    isEmail = !isEmail;
    notifyListeners();
  }

  void smsSwitch() {
    isSMS = !isSMS;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date = '${selectedDate?.day} '
          '${selectedDate?.month.monthName} '
          '${selectedDate?.year}';
      notifyListeners();
    }
  }

  void changefNameValidator(String value) {
    if (value.isEmpty) {
      changeNameValidate = 'Некорректное имя';
      notifyListeners();
    } else {
      changeNameValidate = null;
      newName = value;
      notifyListeners();
    }
  }

  void dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: AlertDialog(
            content: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    newSex = "Мужской";
                    notifyListeners();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Мужской",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    newSex = "Женский";
                    notifyListeners();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Женский",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void allControllers() {
    nameController = TextEditingController(text: user.firstName);
    dateController = TextEditingController(text: date);
    sexController = TextEditingController(text: user.sex ?? newSex);
    emailController = TextEditingController(text: user.email ?? "");
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  void changeEmailValidator(String value) {
    if (!isEmailValid(value)) {
      changeEmailVailidate = 'Некорректное email';
      notifyListeners();
    } else {
      changeEmailVailidate = null;
      newEmail = value;
      notifyListeners();
    }
  }

  void save(BuildContext context) {
    user = UserModel(
      id: user.id,
      firstName: newName ?? user.firstName,
      lastName: user.lastName,
      phoneNumber: phoneNumber,
      lon: lon,
      lat: lat,
      email: newEmail,
      sex: newSex,
      history: user.history,
      korzinka: user.korzinka,
    );

    DBService.updateUser(user);
    showSnackBar(
      context: context,
      color: AppColors.black.withOpacity(0.8),
      text: "Ваши данные сохранены",
    );
  }

  /* MainScreen */

  /* Home Page */

  List<String> currentCategory = [];

  void addCategory(List<String> value) {
    currentCategory = value;
    notifyListeners();
  }

  void chooseCetegory(String value) {
    if (!currentCategory.contains(value)) {
      currentCategory.add(value);
      notifyListeners();
    } else {
      currentCategory.remove(value);
      notifyListeners();
    }
  }

  List<Restaurant> restaurant = Data.restaurant;

  void filter() {
    if (currentCategory.contains('Halal')) {
      restaurant = Data.restaurant;
      notifyListeners();
      return;
    }

    List<Restaurant> find = [];
    if (currentCategory.isNotEmpty) {
      for (int k = 0; k < currentCategory.length; k++) {
        for (int i = 0; i < Data.restaurant.length; i++) {
          for (int j = 0; j < Data.restaurant[i].products.length; j++) {
            if (currentCategory[k].toLowerCase() ==
                Data.restaurant[i].products[j].category.toLowerCase()) {
              find.add(Data.restaurant[i]);
              notifyListeners();
            }
          }
        }
      }
      restaurant = find.toSet().toList();
      notifyListeners();
    } else {
      restaurant = Data.restaurant;
      notifyListeners();
    }
  }

  void isAvailable(RestaurantProducts products) {
    List<RestaurantProducts> newCart = List.from(user.korzinka ?? []);

    bool found = false;

    for (int i = 0; i < newCart.length; i++) {
      if (newCart[i].id == products.id) {
        newCart.removeAt(i);
        newCart.add(products);
        found = true;
        break;
      }
    }

    if (!found) {
      newCart.add(products);
      getCategoryName();
    }

    user.korzinka = newCart;
    productPrice();
    getCategoryName();
    user = UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      lon: user.lon,
      lat: user.lat,
      korzinka: newCart,
      email: user.email,
      sex: user.sex,
      history: user.history,
    );
    DBService.updateUser(user);

    notifyListeners();
  }

  int sum = 0;

  void productPrice() {
    sum = 0;
    if (user.korzinka != null) {
      for (var i in user.korzinka!) {
        sum += (i.count * i.price).toInt();
        notifyListeners();
      }
    }
    notifyListeners();
  }

  void counterProduct(RestaurantProducts product, String character) {
    for (var item in user.korzinka!) {
      if (product.id == item.id) {
        if (character == '-') {
          if (item.count == 1) {
            user.korzinka!.remove(item);
          } else if (item.count > 0) {
            item.count--;
          }
        } else {
          item.count++;
        }
        break;
      }
      notifyListeners();
      DBService.updateUser(user);
    }

    productPrice();
    notifyListeners();
    DBService.updateUser(user);
  }

  List<String> getCategory = [];

  void getCategoryName() {
    if (user.korzinka != null) {
      for (var e in user.korzinka!) {
        for (var data in Data.restaurant) {
          for (var dataPr in data.products) {
            if (dataPr.id == e.id) {
              getCategory.add(data.name);
            }
          }
        }
      }
    }
    getCategory = getCategory.toSet().toList();
    print(getCategory);
    print(121212121);
    print(user.korzinka);
    print(121212121);
    notifyListeners();
  }

  void clearCart() {
    user.history!.addAll(user.korzinka!);

    user.korzinka = null;
    getCategory.clear();
    sum = 0;
    user = UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      lon: user.lon,
      lat: user.lat,
      email: user.email,
      history: user.history,
      korzinka: [],
      sex: user.sex,
    );
    DBService.updateUser(user);
    if (user.korzinka != null) {
      for (var pr in user.korzinka!) {
        pr.count = 0;
        notifyListeners();
      }
    }
    notifyListeners();
    print(
        "==[]=[=[]=[]=[]=[]=][=[]=[=[[]=[]=[=[]][=[]=[=][=[]=[]=[]==][=][=][]]]]]");
    print(user.history);
    print(
        "==[]=[=[]=[]=[]=[]=][=[]=[=[[]=[]=[=[]][=[]=[=][=[]=[]=[]==][=][=][]]]]]");
  }
}
