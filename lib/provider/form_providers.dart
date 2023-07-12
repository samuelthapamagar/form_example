import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/models/form_model.dart';
import 'package:form_example/services/api_services.dart';

// Using State Provider
// final types = ['High', 'Moderate', 'Low'];
// final titleProvider = StateProvider<String>((ref) => '');
// final descriptionProvider = StateProvider<String>((ref) => '');
// final typeProvider = StateProvider<String>((ref) => 'Moderate');
//
// final formDataProvider = FutureProvider<List<FormModel>>((ref) async {
//   return ref.watch(formProvider).getForms();
// });

//Using ChangeNotifier
class FormChangeNotifier extends ChangeNotifier {
  String title = 'No title';
  String description = 'No description';
  String type = 'Moderate';
  List<String> typesList = ['High', 'Moderate', 'Low'];

  void changeType(String t) {
    type = t;
    notifyListeners();
  }
}

final formChangeNotifierProvider =
    ChangeNotifierProvider<FormChangeNotifier>((ref) => FormChangeNotifier());

//Using FutureProvider for api services
final formDataFutureProvider = FutureProvider<List<FormModel>>((ref) async {
  return ref.watch(formProvider).getForms();
});
