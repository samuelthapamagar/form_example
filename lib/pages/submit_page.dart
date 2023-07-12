import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/provider/form_providers.dart';

class SubmitPage extends ConsumerWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formdataProvider = ref.watch(formChangeNotifierProvider);
    // final description = ref.watch(formChangeNotifierProvider).description;
    // final selectedType = ref.watch(formChangeNotifierProvider).type;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Title',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.deepPurple.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(formdataProvider.title),
                ),
              ),
            )),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.deepPurple.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(formdataProvider.description),
                ),
              ),
            )),
            const SizedBox(height: 20),
            const Text(
              'Type',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.deepPurple.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(formdataProvider.type),
                ),
              ),
            )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
