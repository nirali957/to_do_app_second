import 'package:flutter/material.dart';

import 'home_screen.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TimeOfDay time = const TimeOfDay(hour: 5, minute: 33);
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 370,
                  color: Colors.amberAccent,
                  child: const Text(
                    'Title: New task',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 370,
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${date.day}/${date.month}/${date.year}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 370,
                  padding: const EdgeInsets.all(20),
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${time.hour}:${time.minute}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.amberAccent,
                  height: 150,
                  width: 370,
                  child: const Text('Discription:.............',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 100,
                  color: Colors.amberAccent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Ok',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
