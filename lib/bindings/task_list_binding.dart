import 'package:companion_app_nihar/controllers/task_list_controller.dart';
import 'package:get/get.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TaskListController>(TaskListController());
  }
}
