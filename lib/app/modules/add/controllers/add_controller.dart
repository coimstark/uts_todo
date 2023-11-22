import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_todo/app/data/task_model.dart';
import 'package:uts_todo/app/helper/color.dart';
import 'package:uts_todo/app/modules/home/controllers/home_controller.dart';

class AddController extends GetxController {
  final HomeController homeController = Get.find();
  List type = ["Personal", "Private", "Secret"];

  List tag = ["Office", "Home", "Urgent", "Work"];

  List color = [
    CoimColor.bgpurple,
    CoimColor.bgred,
    const Color(0xffFFE9ED),
    CoimColor.bgsky,
  ];

  List textcolor = [
    CoimColor.purple,
    CoimColor.lightred,
    CoimColor.lightred,
    CoimColor.textblue,
  ];

  List hour = ["05", "06", "07", "08", "09", "10", "11", "12"];
  List min = ["25", "26", "27", "28", "29", "30", "31", "32"];

  final RxInt lastindex = 0.obs;
  final RxInt _isselected = 0.obs;
  final RxInt _selecttime = 0.obs;
  final RxInt _selectTag = 0.obs;
  final Rx<DateTime> _selectedDay = DateTime.now().obs;

  int get isselected => _isselected.value;
  int get selecttime => _selecttime.value;
  int get selectTag => _selectTag.value;
  DateTime get selectedDay => _selectedDay.value;

  set isselected(int value) => _isselected.value = value;
  set selecttime(int value) => _selecttime.value = value;
  set selectTag(int value) => _selectTag.value = value;
  set selectedDay(DateTime value) => _selectedDay.value = value;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDay,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDay) {
      selectedDay = picked;
    }
  }

  void selectTagColor(int index) {
    selectTag = index;
  }

  void selectType(int index) {
    isselected = index;
  }

  void selectTime(int index) {
    selecttime = index;
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      homeController.addTask(
        TaskModel(
          title: titleController.text,
          description: descriptionController.text,
          date: selectedDay,
          type: type[isselected],
          tag: tag[selectTag],
          color: color[selectTag],
          textcolor: textcolor[selectTag],
          isdone: false,
        ),
      );
      Get.back();
    }
  }
}
