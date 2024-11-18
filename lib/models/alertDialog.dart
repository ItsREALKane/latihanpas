// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/adapter/toast.dart';
import 'package:latihanpas/app/models/taskModel.dart';
import 'TaskController.dart';

void alertDialog(BuildContext context, TaskModel task) {

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
              leading: Icon(Icons.diamond, color: Colors.white),
              title: Text(
                'Dengarkan Bebas Iklan',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
              leading: Icon(Icons.download_for_offline_outlined,
                  color: Colors.white),
              title: Text(
                'Download',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share_outlined, color: Colors.white),
              title: Text(
                'Bagikan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.qr_code_2, color: Colors.white),
              title: Text(
                'Tampilkan Kode Spotify',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// void alertLike(BuildContext context, taskController, taskId) {

//   final SongController songController = Get.put(SongController());

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.black87,
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.diamond, color: Colors.white),
//               title: Text(
//                 'Dengarkan Bebas Iklan',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.delete,
//                 color: Colors.white, 
//               ),
//               title: TextButton(
//                onPressed: () { 
//                   taskController.deleteTask(taskId);
//                   showCustomToast('Dihapus dari Koleksi Kamu');
//                   Navigator.pop(context);
//                 }, child: Text('Hapus dari Koleksi',style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.download_for_offline_outlined,
//                   color: Colors.white),
//               title: Text(
//                 'Download',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.share_outlined, color: Colors.white),
//               title: Text(
//                 'Bagikan',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2, color: Colors.white),
//               title: Text(
//                 'Tampilkan Kode Spotify',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// void alertSukai(BuildContext context, songsMode task) {

//     final SongController musicContoller = Get.put(SongController());

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.black87,
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(
//                 Icons.favorite,
//                 color: Colors.white,
//               ),
//               title: TextButton(
//                onPressed: () {
//                 musicContoller.addTask(task);
//                 showCustomToast('Ditambahkan ke Lagu yang Disukai');
//                 Navigator.pop(context);
//                }, child: Text('Tambahkan ke Lagu yang Disukai',style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.download_for_offline_outlined,
//                   color: Colors.white),
//               title: Text(
//                 'Download',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.share_outlined, color: Colors.white),
//               title: Text(
//                 'Bagikan',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2, color: Colors.white),
//               title: Text(
//                 'Tampilkan Kode Spotify',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// void alertLikePlay(BuildContext context, taskController, taskId) {

//   final SongController songController = Get.put(SongController());

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.black87,
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             ListTile(
//               leading: Icon(
//                 Icons.delete,
//                 color: Colors.white, 
//               ),
//               title: TextButton(
//                onPressed: () { 
//                   songController.deleteTask(taskId);
//                   showCustomToast('Dihapus dari Koleksi Kamu');
//                   Navigator.pop(context);
//                 }, child: Text('Hapus dari Koleksi',style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.download_for_offline_outlined,
//                   color: Colors.white),
//               title: Text(
//                 'Download',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.share_outlined, color: Colors.white),
//               title: Text(
//                 'Bagikan',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2, color: Colors.white),
//               title: Text(
//                 'Tampilkan Kode Spotify',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
