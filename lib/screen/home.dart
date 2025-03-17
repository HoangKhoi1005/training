import 'dart:math';

import 'package:flutter/material.dart';
import 'package:training/widget/section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;

  List<String> list = ['fdsfsdfds', 'sdf', 'fsdfdsfsdgbdbwebweebweb'];
  int index = 0;

  void onChanged(bool? value) {
    setState(() {
      isActive = value!;
    });
  }

  void randomTitle() {
    if (list.isEmpty) return;
    setState(() {
      int newIndex;
      do {
        newIndex = Random().nextInt(list.length);
      } while (newIndex == index);
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: Colors.amber,
            child: Text(
              list.isEmpty ? 'Danh sách trống' : list[index],
              textAlign: TextAlign.center,
            ),
          ),
          SectionWidget(
            isActive: isActive,
            onChanged: onChanged,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: randomTitle,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
