import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tester/constants.dart';
import 'package:tester/users.dart';

class UsersApi {
  Future<List<Users>> getUsers() async{
    var url = "${baseUrl}users";
    final response = await get(Uri.parse(url));

    if(response.statusCode < 400){
     
      var userDetails = Users.userDetailsFromJson(
        jsonDecode(response.body)
      );
      return userDetails;
    }else{
     throw Exception ('Failed to load data!');
    }
  }
} 