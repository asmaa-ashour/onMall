import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/class/cacheClass%20.dart';
import '../services/services.dart';

class Crud {
  MyServices myServices = Get.find();
  Future<Either<StatusRequest, List>> getRequest(
      String url, Map data, @required dynamic token) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer ${CacheClass.getData(key: "Token")}"
        }, // Use cached token
      );
      print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      //myServices.sharedPreferences.setString("step", "3");
      print("===============================================Language");
      // print(myServices.sharedPreferences.setString("step", "3"));
      print("$response.................crud");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");
        print(responsebody);
        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
/////////////
Future<Either<StatusRequest, Map>> postData(
    String linkurl, Map data, dynamic token) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json', // مهم جدًا
  };

  if (token != null && token.toString().isNotEmpty) {
    headers['Authorization'] = "Bearer $token";
  }

  var response = await http.post(
    Uri.parse(linkurl),
    body: jsonEncode(data),
    headers: headers,
  );

  print("STATUS CODE: ${response.statusCode}");
  print("BODY: ${response.body}");

  // ✅ حالة النجاح
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map responsebody = jsonDecode(response.body);
    return Right(responsebody);

  // ⚠️ حالة validation error (مثل الايميل موجود)
  } else if (response.statusCode == 422) {
    Map responsebody = jsonDecode(response.body);
    Get.snackbar(
      "Error",
      responsebody['message'] ?? "Validation error",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.7),
      colorText: Colors.white,
    );
    return const Left(StatusRequest.failure);

  // ❌ باقي الأخطاء
  } else {
    return const Left(StatusRequest.serverfailure);
  }
}

  ///////////////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> postedData({
    required String url,
    required Map<String, dynamic> body,
    // @required dynamic token
  }) async {
    try {
      print(url);
      print(body);
      //print(token);
      var response = await http.post(
        Uri.parse(url),
        body: body,
        // headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"},
      );
      //   print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      print("$response.................crud tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}cruddddddddddddddddddddddddddddd');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
/*
  //////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> putData(
      {required String url,
      required Map<String, dynamic> body,
      @required dynamic token}) async {
    try {
      print(url);
      print(body);
      print(token);
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"},
      );

      print("$response.................crud tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}cruddddddddddddddddddddddddddddd');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

//////////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> delete({
    required String url,
    @required dynamic token,
  }) async {
    try {
      print(url);
      print(token);
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Accept-Language': lang,
          'Authorization': "Bearer$token",
        },
      );
      print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      print("$response.................crud delete tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}crudddddddddddddddddddddddddddddelete');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............cruddelet ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
  */
}
