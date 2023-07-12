import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/pages/post_request_page.dart';
import 'package:form_example/services/api_services.dart';
import '../provider/form_providers.dart';
import 'form_list_page.dart';

class DeletePage extends ConsumerStatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeletePage createState() => _DeletePage();
}

class _DeletePage extends ConsumerState<DeletePage> {
  final _idTextController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  @override
  void dispose() {
    super.dispose();
   _idTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formDataProvider = ref.watch(formChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete page'),
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
              onChanged: (String? value) {},
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.deepPurple,
                child: MaterialButton(
                  minWidth: 150,
                  height: 60,
                  onPressed: () {
                    ref.read(formProvider).deleteForms(id: int.parse(_idTextController.text));
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

