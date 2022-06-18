import 'package:companion_app/models/task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TaskListController extends GetxController {
  static TaskListController get to => Get.find();
  final TextEditingController task = TextEditingController();

  final getStorage = GetStorage();

  var tasks = List<Task>.empty().obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    List? storedTask = getStorage.read<List>('task');
    if (storedTask != null) {
      tasks = storedTask.map((e) => Task.fromJson(e)).toList().obs;
    }
    ever(tasks, (_) async {
      getStorage.write('task', tasks.toList());
    });

    super.onReady();
  }

  // @override
  // void onClose() {}
}
