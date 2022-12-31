import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
// ignore: unused_import
import 'package:scare/bloc/auth_bloc/auth_state.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/loginmodel.dart';
import 'package:scare/models/signinmodel.dart';
import 'package:scare/models/usermodel.dart';

import '../models/userdatamodel.dart';

class Userrepository {
  String baseUrl = 'http://2878-102-91-4-217.eu.ngrok.io';
  addUsers(Usermodel model) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/addUser/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'phone': model.number,
            'password': model.number,
          }));
      if (response.statusCode == 201) {
        Signinmodel data = Signinmodel.fromJson(jsonDecode(response.body));
        return data;
      } else if (response.statusCode == 400) {
        throw jsonDecode(response.body);
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }

  loginUser(Usermodel model) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/login/'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {'user_id': model.number, 'password': model.password}));
      if (response.statusCode == 200) {
        Loginmodel data = Loginmodel.fromJson(jsonDecode(response.body));

        return data;
      } else if (response.statusCode == 400) {
        throw jsonDecode(response.body);
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }

  authenticateUser(Authmodel authmodel) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/addUser/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "phone": authmodel.number,
          }));
      if (response.statusCode == 200) {
        Authmodel pin = Authmodel.fromJson(jsonDecode(response.body));
        return pin;
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }

  logOut(String token) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/logout/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "token": token,
          }));
      if (response.statusCode == 200) {
        return false;
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }

  getName(String number) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/get_name/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "phone": number,
          }));
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }
}
