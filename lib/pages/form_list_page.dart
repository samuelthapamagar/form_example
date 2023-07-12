import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/models/form_model.dart';
import 'package:form_example/provider/form_providers.dart';
import 'package:form_example/services/api_services.dart';

import '../components/details_widget.dart';

class FormListPage extends ConsumerWidget {
  const FormListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(formDataFutureProvider);
    ref.invalidate(formDataFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All forms'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: data.when(
            data: (data) {
              List<FormModel> formList = data.map((e) => e).toList();
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: formList.length,
                        itemBuilder: (_, index) {
                          return DetailsWidget(
                              formList: formList, index: index);
                        }),
                  )
                ],
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
