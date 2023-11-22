import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uts_todo/app/data/task_model.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  RxList<TaskModel> taskList = <TaskModel>[].obs;
  final RxInt _incomingTask = 0.obs;
  final RxInt _outgoingTask = 0.obs;

  int get incomingTask => _incomingTask.value;
  int get outgoingTask => _outgoingTask.value;

  set incomingTask(int value) => _incomingTask.value = value;
  set outgoingTask(int value) => _outgoingTask.value = value;

  // calculate incoming task and outgoing task based on date
  void calculateTask() {
    incomingTask = 0;
    outgoingTask = 0;
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].date != null) {
        if (taskList[i].date!.isBefore(DateTime.now())) {
          taskList[i].isdone = true;
          box.write('task', taskList);

          outgoingTask++;
        } else {
          incomingTask++;
        }
      } else {
        outgoingTask++;
      }
    }
  }

  void loadTasks() {
    List? list = box.read<List>('task');
    if (list != null) {
      taskList = list.map((e) => TaskModel.fromJson(e)).toList().obs;
    }
    calculateTask();
  }

  void addTask(TaskModel task) {
    taskList.add(task);
    box.write('task', taskList);
    calculateTask();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    box.write('task', taskList);
    calculateTask();
  }

  void updateTask(int index, TaskModel task) {
    taskList[index] = task;
    box.write('task', taskList);
    calculateTask();
  }

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }
}
