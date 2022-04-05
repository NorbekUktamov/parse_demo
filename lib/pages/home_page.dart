import 'package:flutter/material.dart';
import 'package:parse_demo/models/employee_one.dart';
import 'package:parse_demo/pages/detail_page.dart';

import '../models/employee_list.dart';
import '../models/employee_model.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {


  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response),
    });
  }



  void _showResponse(String response) {

    if(response != null){
      EmpList empList = Network.parseEmpList(response);
      setState(() {
        items = empList.data;
      });
    }else{
      print("Try again");
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: () {

        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
           DetailPage(emp: emp,),
        );
        Navigator.of(context).push(route);
      },
      child:  Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name+"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 18),),
          ],
        ),
      ),
    );
  }
}