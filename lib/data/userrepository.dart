import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
// ignore: unused_import
import 'package:scare/bloc/auth_bloc/auth_state.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/usermodel.dart';

class Userrepository {
  addUsers(Usermodel model) async {
    try {
      Response response =
          await post(Uri.parse('http://1ac7-102-91-4-155.ngrok.io/addUser/'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({
                'username': model.username,
                'phone': model.number,
                'email': model.email,
                'password': model.password,
              }));
      if (response.statusCode == 201) {
        Usermodel data = Usermodel.fromJson(jsonDecode(response.body));
        return data;
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

  loginuser(Usermodel model) async {
    try {
      Response response = await post(
          Uri.parse('http://1ac7-102-91-4-155.ngrok.io/login/'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {'user_id': model.number, 'password': model.password}));
      if (response.statusCode == 200) {
        Usermodel data = Usermodel.fromJson(jsonDecode(response.body));
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
      Response response = await post(
          Uri.parse(
              'http://2fc9-197-210-53-11.ngrok.io/path/phone-number/sent/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "phone": "+2347067282050",
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
}
