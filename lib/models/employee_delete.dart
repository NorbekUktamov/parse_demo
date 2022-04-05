
class EmpDel{

  String status;
  String message;
  int data;

  EmpDel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = json['data'];



  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toString(),
  };



}