import 'package:flutter/material.dart';
import 'package:to_do_app_second/common_widget/common_textfield.dart';

import '../model/to_do_model.dart';

class AddScreen extends StatefulWidget {
  final ToDoListModel? item;

  const AddScreen({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.item != null) {
      titleController.text = widget.item!.title!;
      timeController.text = widget.item!.time!;
      dateController.text = widget.item!.date!;
      descriptionController.text = widget.item!.description!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO ADD'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CommonTextField(
            textEditingController: titleController,
            hintText: "Title",
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2040),
              );
              debugPrint("date ----------->> $pickedDate");
              dateController.text = pickedDate.toString().split(" ").first;
              setState(() {});
            },
            child: CommonTextField(
              textEditingController: dateController,
              enabled: false,
              hintText: "Select Date",
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              TimeOfDay? pickTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              debugPrint("Time ---------->> ${pickTime!.format(context)}");
              timeController.text = pickTime.format(context);
              setState(() {});
            },
            child: CommonTextField(
              enabled: false,
              textEditingController: timeController,
              hintText: "Select Time",
            ),
          ),
          const SizedBox(height: 15),
          CommonTextField(
            textEditingController: descriptionController,
            maxLines: 7,
            minLines: 5,
            hintText: "Description",
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 90, left: 90),
            child: ElevatedButton(
              onPressed: () {
                ToDoListModel todoModel = ToDoListModel(
                  title: titleController.text,
                  date: dateController.text,
                  time: timeController.text,
                  description: descriptionController.text,
                );
                Navigator.pop(context, todoModel);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(double.infinity, 40),
                ),
              ),
              child: const Text("Add ToDo"),
            ),
          ),
        ],
      ),
    );
  }
}
