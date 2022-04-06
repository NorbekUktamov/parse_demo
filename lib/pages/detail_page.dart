import 'package:flutter/material.dart';
import 'package:parse_demo/models/employee_model.dart';

import '../models/employee_one.dart';
import '../services/http_service.dart';

class DetailPage extends StatefulWidget {
  final Employee emp;
  DetailPage({Key? key,required this.emp,}) : super(key: key);

  static final String id = "detail_page";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(widget.emp.employee_name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${widget.emp.id.toString()}"),
                      ),
                      ListTile(
                        title: Text("Age"),
                        subtitle: Text(widget.emp.employee_age.toString()),
                      ),
                      ListTile(
                        title: Text("Salary"),
                        subtitle: Text("${widget.emp.employee_salary.toString()}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
