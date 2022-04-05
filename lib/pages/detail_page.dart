import 'package:flutter/material.dart';

import '../models/employee_one.dart';
import '../services/http_service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static final String id = "detail_page";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  void _showResponse(String response) {
    if (response != null) {
      EmpOne empone = Network.parseEmpOne(response);

      setState(() {

      });
    } else {
      print("Try again");
    }
  }



  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Data"),
      ),
    );
  }
}
