import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../widgets/item_editor.dart';
import '../models/box.dart';
import '../widgets/box_editor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Item keyItem;
  late Box box;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    keyItem = Provider.of<Item>(context, listen: true);
    box = Provider.of<Box>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Experiment')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('BoxEditor Widget. The box has ${box.itemCount} items'),
              const BoxEditor(),
              Text('ItemEditor Widget: The item is ${keyItem.name}'),
              ItemEditor(item: keyItem),
            ],
          ),
        ),
      ),
    );
  }
}
