import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/pages/post_request_page.dart';
import 'package:form_example/pages/see_forms_page.dart';
import 'package:form_example/pages/submit_page.dart';
import 'package:form_example/pages/form_list_page.dart';
import 'package:form_example/pages/update_page.dart';
import 'package:form_example/services/api_services.dart';

import '../models/form_model.dart';
import '../provider/form_providers.dart';
import 'delete_page.dart';

class HomePage2 extends ConsumerStatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2 createState() => _HomePage2();
}

class _HomePage2 extends ConsumerState<HomePage2> {
  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

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
    // print(data);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter riverpod with api'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Choose options :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
               const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.deepPurple,
                    child: MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FormListPage(),
                            ));
                      },
                      child: const Text(
                        'See forms',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.deepPurple,
                    child: MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const PostRequestPage();
                        }));
                      },
                      child: const Text(
                        'Post request',
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.deepPurple,
                    child: MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdatePage(),
                            ));
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.deepPurple,
                    child: MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const DeletePage();
                        }));

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
          ],
        ),
      ),
    );
  }
}
