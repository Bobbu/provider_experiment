import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/box.dart';
import '../models/item.dart';

class BoxEditor extends StatefulWidget {
  const BoxEditor({super.key});

  @override
  State<BoxEditor> createState() => _BoxEditorState();
}

class _BoxEditorState extends State<BoxEditor> {
  late Box box;

  // @override
  // void initState() {
  //   super.initState();
  // }

  Future<void> _removeFromBox(Item item) async {
    setState(() {
      box.remove(item);
    });
  }

  Future<void> _editItem(Item item) async {
    debugPrint('In editItem with ${item.name}. It will now be the keyItem');
    setState(() {
      Provider.of<Item>(context, listen: false).name = item.name;
      //box.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    box = Provider.of<Box>(context, listen: true);
    debugPrint(
        'The box now has ${Provider.of<Box>(context, listen: false).itemCount} items');
    final stuff = box.stuff;
    final itemCount = stuff.length;
    debugPrint('and the stuff has $itemCount items');

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.red[200]!,
      height: 250,
      width: 400,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.black87),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _editItem(stuff.elementAt(index)),
            title: Text(stuff.elementAt(index).name),
            trailing: IconButton(
                onPressed: () => _removeFromBox(stuff.elementAt(index)),
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
