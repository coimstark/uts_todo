import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_todo/app/helper/color.dart';
import 'package:uts_todo/app/helper/fontstyle.dart';
import 'package:uts_todo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 36,
                ),
                Text(
                  "My Task",
                  style: hsSemiBold.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: height / 36,
                ),
                Row(
                  children: [
                    Container(
                      height: height / 6,
                      width: width / 2.2,
                      decoration: BoxDecoration(
                          color: CoimColor.purple,
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36, vertical: height / 66),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: CoimColor.white,
                                  size: 22,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward,
                                  color: CoimColor.white,
                                  size: 22,
                                )
                              ],
                            ),
                            SizedBox(
                              height: height / 66,
                            ),
                            Text(
                              "In Progress",
                              style: hsMedium.copyWith(
                                  fontSize: 16, color: CoimColor.white),
                            ),
                            SizedBox(
                              height: height / 120,
                            ),
                            Text(
                              "${controller.incomingTask} Task",
                              style: hsRegular.copyWith(
                                  fontSize: 14, color: CoimColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: height / 6,
                      width: width / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36, vertical: height / 66),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: CoimColor.white,
                                  size: 22,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward,
                                  color: CoimColor.white,
                                  size: 22,
                                )
                              ],
                            ),
                            SizedBox(
                              height: height / 66,
                            ),
                            Text(
                              "Done",
                              style: hsMedium.copyWith(
                                  fontSize: 16, color: CoimColor.white),
                            ),
                            SizedBox(
                              height: height / 120,
                            ),
                            Text(
                              "${controller.outgoingTask} Task",
                              style: hsRegular.copyWith(
                                  fontSize: 14, color: CoimColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 26,
                ),
                Text(
                  "Task List",
                  style: hsSemiBold.copyWith(fontSize: 24),
                ),
                ListView.builder(
                  itemCount: controller.taskList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: CoimColor.transparent,
                      highlightColor: CoimColor.transparent,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: height / 2,
                                width: width,
                                decoration: BoxDecoration(
                                  color: CoimColor.white,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 66),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Task Detail",
                                        style: hsSemiBold,
                                      ),
                                      SizedBox(
                                        height: height / 66,
                                      ),
                                      Text(
                                        "${controller.taskList[index].description}",
                                        style: hsMedium.copyWith(
                                            fontSize: 14,
                                            color: CoimColor.black,
                                            decoration: controller
                                                    .taskList[index].isdone!
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: height / 46),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: CoimColor.bggray,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 36, vertical: height / 66),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.taskList[index].title}",
                                    style: hsMedium.copyWith(
                                      fontSize: 16,
                                      color: CoimColor.black,
                                      decoration:
                                          controller.taskList[index].isdone!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 120,
                                  ),
                                  Text(
                                    DateFormat.yMMMMd().format(
                                        controller.taskList[index].date!),
                                    style: hsRegular.copyWith(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 120,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: controller
                                                  .taskList[index].color,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width / 36,
                                                vertical: height / 120),
                                            child: Text(
                                              controller.taskList[index].tag!,
                                              style: hsMedium.copyWith(
                                                fontSize: 10,
                                                color: CoimColor.appcolor,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: width / 36,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: controller
                                                  .taskList[index].color,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width / 36,
                                                vertical: height / 120),
                                            child: Text(
                                              controller.taskList[index].type!,
                                              style: hsMedium.copyWith(
                                                fontSize: 10,
                                                color: CoimColor.appcolor,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Delete Task",
                                    middleText:
                                        "Are you sure want to delete this task?",
                                    textConfirm: "Yes",
                                    textCancel: "No",
                                    confirmTextColor: CoimColor.white,
                                    buttonColor: CoimColor.appcolor,
                                    cancelTextColor: CoimColor.black,
                                    onConfirm: () {
                                      controller.deleteTask(index);
                                      Get.back();
                                    },
                                    onCancel: () {
                                      Get.back();
                                    },
                                  );
                                },
                                child: Container(
                                  height: height / 24,
                                  width: width / 12,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: CoimColor.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD);
          },
          backgroundColor: CoimColor.appcolor,
          child: const Icon(Icons.add, color: CoimColor.white),
        ),
      ),
    );
  }
}
