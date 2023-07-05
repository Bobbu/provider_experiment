import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/box.dart';
import '../models/item.dart';

class ItemEditor extends StatefulWidget {
  const ItemEditor({super.key, required this.item});

  final Item item;

  @override
  State<ItemEditor> createState() => _ItemEditorState();
}

class _ItemEditorState extends State<ItemEditor> {
  final nameController = TextEditingController(text: '');

  @override
  void initState() {
    nameController.text = widget.item.name;
    super.initState();
  }

  Future<void> _onEditingComplete() async {
    debugPrint(nameController.text);
    setState(() {
      widget.item.name = nameController.text;
    });
  }

  Future<void> _onAdd() async {
    debugPrint(nameController.text);
    Item newItem = Item(widget.item.name);
    setState(() {
      Provider.of<Box>(context, listen: false).add(newItem);
      debugPrint(
          'The box now has ${Provider.of<Box>(context, listen: false).itemCount} items');
      widget.item.name = nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = Provider.of<Item>(context, listen: true).name;
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blue[200]!,
      height: 200,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            const Text('Item Name'),
            const SizedBox(width: 10),
            SizedBox(
              width: 200,
              child: TextField(
                onEditingComplete: _onEditingComplete,
                controller: nameController,
              ),
            )
          ]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: _onAdd,
                  icon: const Icon(Icons.add),
                  label: const Text('Add to box'))
            ],
          )
        ],
      ),
    );
  }
}
