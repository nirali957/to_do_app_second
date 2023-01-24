import 'package:flutter/material.dart';

import '../model/to_do_model.dart';
import 'home_screen.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  DateTime date = DateTime(2023, 01, 23);
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);
  ToDoListModel? toDoListModel;
  int val = 0;
  List<String> data = [];

  @override
  void initState() {
    // TODO: implement initState
    toDoListModel = ToDoListModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.add((val++).toString());
          toDoListModel!.tasklist = data;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: toDoListModel!.tasklist == null
            ? const SizedBox()
            : ListView.builder(
                itemCount: toDoListModel!.tasklist!.length,
                itemBuilder: (context, index) => SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Task: ${toDoListModel!.tasklist![index]}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.indigo),
                                  hintText: "Write your title...",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.indigo),
                                  hintText: "Write your Description...",
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );
                                if (newDate == null) return;
                                setState(
                                  () => date = newDate,
                                );
                              },
                              child: const Text("Select Date"),
                            ),
                            Text(
                              "${date.day}/${date.month}/${date.year}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: time,
                                );
                                if (newTime == null) return;
                                setState(
                                  () => time = newTime,
                                );
                              },
                              child: const Text("Select Time"),
                            ),
                            Text(
                              "${time.hour}:${time.minute}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              textAlign: TextAlign.center,
                              'Ok',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
