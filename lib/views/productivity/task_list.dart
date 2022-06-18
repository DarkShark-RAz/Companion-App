import 'package:companion_app/controllers/task_list_controller.dart';
import 'package:companion_app/models/task_list_model.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TaskList extends GetView<TaskListController> {
  final int? index;
  TaskList({Key? key, @required this.index}) : super(key: key);

  void _showAddDialog({required context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add Task',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontFamily: 'JekoBold',
                  color: Colors.black,
                  fontSize: SizeConfig.safeVertical! * 0.02,
                ),
          ),
          content: TextField(
            autofocus: true,
            controller: controller.task,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontFamily: 'JekoBold',
                  color: Colors.black,
                  fontSize: SizeConfig.safeVertical! * 0.02,
                ),
            onChanged: (value) {
              // controller.addTask(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontFamily: 'JekoBold',
                      color: Colors.black,
                      fontSize: SizeConfig.safeVertical! * 0.02,
                    ),
              ),
              onPressed: () {
                Get.back();
                controller.task.clear();
              },
            ),
            TextButton(
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontFamily: 'JekoBold',
                      color: Colors.black,
                      fontSize: SizeConfig.safeVertical! * 0.02,
                    ),
              ),
              onPressed: () {
                controller.tasks.add(
                  Task(
                    text: controller.task.text,
                  ),
                );
                Get.back();
                controller.task.clear();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog({required context, required index}) {
    final TextEditingController textEditingController =
        TextEditingController(text: controller.tasks[index!].text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Edit Task',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontFamily: 'JekoBold',
                  color: Colors.black,
                  fontSize: SizeConfig.safeVertical! * 0.02,
                ),
          ),
          content: TextField(
            autofocus: true,
            controller: textEditingController,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontFamily: 'JekoBold',
                  color: Colors.black,
                  fontSize: SizeConfig.safeVertical! * 0.02,
                ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontFamily: 'JekoBold',
                      color: Colors.black,
                      fontSize: SizeConfig.safeVertical! * 0.02,
                    ),
              ),
              onPressed: () {
                Get.back();
                controller.task.clear();
              },
            ),
            TextButton(
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontFamily: 'JekoBold',
                      color: Colors.black,
                      fontSize: SizeConfig.safeVertical! * 0.02,
                    ),
              ),
              onPressed: () {
                var editing = controller.tasks[index!];
                editing.text = textEditingController.text;
                controller.tasks[index!] = editing;
                Get.back();
                controller.task.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: SizeConfig.safeVertical! * 0.15,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/memphis.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/text/increase-productivity.svg',
                    fit: BoxFit.contain,
                    width: SizeConfig.safeHorizontal! * 0.8,
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0,
                    SizeConfig.safeVertical! * 0.12,
                    0,
                  ),
                  child: Center(
                    child: Text(
                      'Tasklist to priortise, focus and get direction',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeVertical! * 0.02),
            child: Column(
              children: <Widget>[
                Obx(
                  () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: CustomColors.appGreen,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (_) {
                        controller.tasks.removeAt(index);
                        Get.snackbar(
                          'Remove!',
                          "Task was succesfully Delete",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          controller.tasks[index].text!,
                          style: controller.tasks[index].done
                              ? const TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'JekoBold',
                                )
                              : const TextStyle(
                                  fontFamily: 'JekoBold',
                                  color: Colors.black,
                                ),
                        ),
                        trailing: IconButton(
                          onPressed: () =>
                              {_showEditDialog(context: context, index: index)},
                          icon: const Icon(Icons.edit),
                        ),
                        leading: Checkbox(
                          activeColor: CustomColors.appGreen,
                          value: controller.tasks[index].done,
                          onChanged: (newValue) {
                            var task = controller.tasks[index];
                            task.done = newValue!;
                            controller.tasks[index] = task;
                          },
                        ),
                      ),
                    ),
                    itemCount: controller.tasks.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context: context);
        },
        child: Icon(Icons.add),
        backgroundColor: CustomColors.appGreen,
      ),
    );
  }
}
