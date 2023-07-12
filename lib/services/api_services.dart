import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/models/form_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  final String endpoint = 'http://192.168.1.91:3000/forms';

  Future<List<FormModel>> getForms() async {
    http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => FormModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

   postForms({required Map<String, dynamic> requestBody}) async {
    http.Response response = await http.post(Uri.parse(endpoint),body: requestBody);
    if (response.statusCode == 200) {
      print('Post Successfull');
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  deleteForms({required int id}) async {
    http.Response response = await http.delete(Uri.parse(endpoint+'/'+id.toString()));
    if (response.statusCode == 201) {
      print('Delete Successfull');
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  updateForms({required int id, required Map<String, dynamic> requestBody}) async {
    http.Response response = await http.put(Uri.parse(endpoint+'/'+id.toString()),body: requestBody);
    if (response.statusCode == 200) {
      print('update Successfull');
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final formProvider = Provider<APIServices>((ref) => APIServices());
