import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:mobcom_final_task/model/user_model.dart';
import 'dart:io';

String url = 'https://randomuser.me/api/1.2/';

Future<UserResponse> getAllUsers() async{
  final response = await http.get(url);
  print(response.body);
  return userResponseFromJson(response.body);
}

Future<http.Response> createConnection() async {
  final response = await http.get('$url', 
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: ''
    }
  );
  return response;
}

