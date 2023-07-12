import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ExamplePage extends ConsumerStatefulWidget {
  @override
  _ExamplePage createState() => _ExamplePage();
}

class _ExamplePage extends ConsumerState<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    // Widget tree goes here
    return Container();
  }

  @override
  void dispose() {
    // Clean-up tasks go here
    // E.g., cancel subscriptions, dispose of resources, etc.

    super.dispose();
  }
}

class ExamplePage1 extends ConsumerStatefulWidget {
  const ExamplePage1({Key? key}) : super(key: key);

  @override
  _ExamplePage1 createState() => _ExamplePage1();
}

class _ExamplePage1 extends ConsumerState<ExamplePage1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
