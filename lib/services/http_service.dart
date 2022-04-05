
import 'dart:convert';

import 'package:http/http.dart';

import '../models/employee_delete.dart';
import '../models/employee_list.dart';
import '../models/employee_one.dart';
import '../models/employee_create.dart';
import '../models/employee_update.dart';
import '../models/user_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };



  /* Http Apis */

  static String API_EMP_LIST = "/api/v1/employees";
  static String API_EMP_ONE = "/api/v1/employee/"; //{id}
  static String API_EMP_CREATE = "/api/v1/create";
  static String API_EMP_UPDATE = "/api/v1/update/"; //{id}
  static String API_EMP_DELETE = "/api/v1/delete/"; //{id}


  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  /* Http Parsing */

  /* Http Parsing */

  static EmpList parseEmpList(String body){
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpCreate parseEmpCreate(String body){
    dynamic json = jsonDecode(body);
    var data = EmpCreate.fromJson(json);
    return data;
  }

  static EmpUpdate parseEmpUpdate(String body){
    dynamic json = jsonDecode(body);
    var data = EmpUpdate.fromJson(json);
    return data;
  }

  static EmpDel parseEmpDel(String body){
    dynamic json = jsonDecode(body);
    var data = EmpDel.fromJson(json);
    return data;
  }



}