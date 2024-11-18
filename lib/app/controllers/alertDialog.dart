// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/adapter/toast.dart';
import 'package:latihanpas/app/models/taskModel.dart';
import 'TaskController.dart';

void alertLike(BuildContext context, TaskModel task) {

    final TaskController taskController = Get.put(TaskController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black87,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.white,
              ),
              title: TextButton(
               onPressed: () {
                taskController.addTask(task);
                showCustomToast('Ditambahkan ke Koleksi Kamu');
                Navigator.pop(context);
               }, child: Text('Tambahkan ke Koleksi',style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share_outlined, color: Colors.white),
              title: Text(
                'Bagikan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void alertUnLike(BuildContext context, taskController, taskId) {

  final TaskController taskController = Get.put(TaskController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black87,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.white, 
              ),
              title: TextButton(
               onPressed: () { 
                  taskController.deleteTask(taskId);
                  showCustomToast('Dihapus dari Koleksi Kamu');
                  Navigator.pop(context);
                }, child: Text('Hapus dari Koleksi',style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share_outlined, color: Colors.white),
              title: Text(
                'Bagikan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}
