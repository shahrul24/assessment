import 'dart:convert';
import 'package:assessment_project/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://1.9.118.25:8822/tsk-matic-erp/public/api/api_test';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/vehicleList'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Vehicle> vehicle = it.map((e) => Vehicle.fromJson(e)).toList();
        return vehicle;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getaddData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/add'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Vehicle> vehicle = it.map((e) => Vehicle.fromJson(e)).toList();
        return vehicle;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String reg_no, String model) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/add'),
          body: {"reg_no": reg_no, "model": model});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
