import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app_second/screens/to_do_complete_screen.dart';
import 'package:to_do_app_second/utils/constant.dart';

import '../model/to_do_model.dart';
import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoListModel> listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToDoCompleteScreen(),
                )),
            icon: const Icon(Icons.check_box),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );

          if (data != null) {
            listData.add(data);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: listData.isEmpty
          ? const Center(
              child: Text(
                "No Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.separated(
              itemCount: listData.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = listData[index];
                return Slidable(
                  key: UniqueKey(),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {
                      listofcompletedata.add(item);
                      listData.removeAt(index);
                      setState(() {});
                    }),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.check,
                        label: 'Complete',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          dynamic data = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(
                                item: item,
                              ),
                            ),
                          );

                          if (data != null) {
                            listData[index] = data;
                            setState(() {});
                          }
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          listData.removeAt(index);
                          setState(() {});
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    tileColor: Colors.grey.shade400,
                    title: Text('Title: ${item.title}'),
                    subtitle: Text('Description: ${item.description}'),
                    trailing: Text('Date: ${item.date}\nTime: ${item.time} '),
                  ),
                );
              },
            ),
    );
  }
}
