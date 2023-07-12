import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/models/form_model.dart';
import 'package:form_example/pages/submit_page.dart';
import 'package:form_example/services/api_services.dart';

import '../provider/form_providers.dart';

class UpdatePage extends ConsumerStatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePage createState() => _UpdatePage();
}

class _UpdatePage extends ConsumerState<UpdatePage> {
  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _idTextController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _descriptionTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formDataProvider = ref.watch(formChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update page'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'ID',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _idTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter ID no.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (String? value) {
                formDataProvider.title = _titleTextController.text;
              },
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Title',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                hintText: 'Enter title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (String? value) {
                formDataProvider.title = _titleTextController.text;
              },
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionTextController,
              decoration: InputDecoration(
                hintText: 'Enter Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (String? value) {
                formDataProvider.description = _descriptionTextController.text;
              },
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: false,
                  items: formDataProvider.typesList.map(buildMenuItem).toList(),
                  hint: const Text('Select Type'),
                  value: formDataProvider.type,
                  onChanged: (String? value) {
                    formDataProvider.changeType(value!);
                    // print(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.deepPurple,
                child: MaterialButton(
                  minWidth: 150,
                  height: 60,
                  onPressed: () {
                    var body= FormModel(
                      title: _titleTextController.text,
                      description: _descriptionTextController.text,
                      type: formDataProvider.type,
                    );
                    Map<String, dynamic> requestBody = body.toJson();

                    ref.read(formProvider).updateForms(id: int.parse(_idTextController.text), requestBody: requestBody);


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubmitPage(),
                        ));

                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

