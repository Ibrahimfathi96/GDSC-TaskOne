import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  static const String routeName = 'animated-list';

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: const Color(0xff41413f),
        title: const Text(
          'Animated List',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: const Color(0xff0D1B28),
      body: Column(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: IconButton(
              onPressed: addItem,
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: key,
              initialItemCount: items.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    color: Colors.orange,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(items[index],
                          style: const TextStyle(fontSize: 24)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeItem(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addItem() {
    items.insert(0, "Item ${items.length + 1}");
    key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 300));
  }

  void removeItem(int index) {
    key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.symmetric(horizontal: 10),
          elevation: 10,
          color: Colors.red,
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text("Deleted", style: TextStyle(fontSize: 26)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 300));
    items.removeAt(index);
  }
}
