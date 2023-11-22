import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uts_todo/app/helper/color.dart';
import 'package:uts_todo/app/helper/fontstyle.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashColor: CoimColor.transparent,
            highlightColor: CoimColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height / 20,
              width: height / 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CoimColor.white,
                  boxShadow: const [
                    BoxShadow(color: CoimColor.textgray, blurRadius: 5)
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: width / 56),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: CoimColor.black,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Add Task",
          style: hsSemiBold.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: height / 36),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tittle",
                    style: hsSemiBold,
                  ),
                  TextField(
                    controller: controller.titleController,
                    style:
                        hsMedium.copyWith(fontSize: 16, color: CoimColor.black),
                    decoration: InputDecoration(
                      hintStyle: hsMedium.copyWith(
                          fontSize: 16, color: CoimColor.textgray),
                      hintText: "Create a new task",
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: CoimColor.greyy),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  const Text(
                    "Date",
                    style: hsSemiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: CoimColor.transparent,
                    highlightColor: CoimColor.transparent,
                    onTap: () {
                      controller.selectDate(context);
                    },
                    child: Container(
                      width: width / 1,
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: CoimColor.greyy)),
                      child: Center(
                          child: Text(
                        DateFormat.yMMMMd().format(controller.selectedDay),
                        style: hsMedium.copyWith(
                            fontSize: 16, color: CoimColor.black),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  const Text(
                    "Description",
                    style: hsSemiBold,
                  ),
                  TextField(
                    controller: controller.descriptionController,
                    style:
                        hsMedium.copyWith(fontSize: 16, color: CoimColor.black),
                    decoration: InputDecoration(
                        hintStyle: hsMedium.copyWith(
                            fontSize: 16, color: CoimColor.textgray),
                        hintText: "Creating this month's work plan",
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: CoimColor.greyy))),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  SizedBox(
                    height: height / 26,
                    child: ListView.builder(
                      itemCount: controller.type.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => Padding(
                            padding: EdgeInsets.only(right: width / 20),
                            child: InkWell(
                              splashColor: CoimColor.transparent,
                              highlightColor: CoimColor.transparent,
                              onTap: () {
                                controller.isselected = index;
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    controller.isselected == index
                                        ? Icons.check_box_sharp
                                        : Icons.check_box_outline_blank,
                                    size: 22,
                                    color: controller.isselected == index
                                        ? CoimColor.appcolor
                                        : CoimColor.textgray,
                                  ),
                                  SizedBox(
                                    width: width / 36,
                                  ),
                                  Text(
                                    controller.type[index],
                                    style: hsRegular.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  const Text(
                    "Tags",
                    style: hsSemiBold,
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  SizedBox(
                    height: height / 21,
                    child: ListView.builder(
                      itemCount: controller.tag.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.selectTag = index;
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: width / 36),
                              height: height / 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.selectTag == index
                                    ? controller.color[index]
                                    : CoimColor.transparent,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 20),
                                child: Text(
                                  controller.tag[index],
                                  style: hsRegular.copyWith(
                                    fontSize: 14,
                                    color: controller.selectTag == index
                                        ? controller.textcolor[index]
                                        : CoimColor.textgray,
                                  ),
                                ),
                              )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 26,
                  ),
                  InkWell(
                    splashColor: CoimColor.transparent,
                    highlightColor: CoimColor.transparent,
                    onTap: () {
                      controller.addTask();
                    },
                    child: Container(
                      width: width / 1,
                      height: height / 15,
                      decoration: BoxDecoration(
                          color: CoimColor.appcolor,
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                          child: Text(
                        "Create",
                        style: hsSemiBold.copyWith(
                            fontSize: 16, color: CoimColor.white),
                      )),
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
