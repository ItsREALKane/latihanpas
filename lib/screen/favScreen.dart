import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/controllers/TaskController.dart';
import 'package:latihanpas/app/controllers/alertDialog.dart';
import 'package:latihanpas/screen/teamDetailScreen.dart';
import 'package:latihanpas/widgets/gridItem.dart';

// Model untuk menu item
class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});
}

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List<MenuItem> menuItems = [
    MenuItem(title: 'Profile', icon: Icons.person),
    MenuItem(title: 'Settings', icon: Icons.settings),
    MenuItem(title: 'Notifications', icon: Icons.notifications),
    MenuItem(title: 'Messages', icon: Icons.message),
    MenuItem(title: 'Analytics', icon: Icons.analytics),
    MenuItem(title: 'Reports', icon: Icons.report),
    MenuItem(title: 'Calendar', icon: Icons.calendar_today),
    MenuItem(title: 'Help', icon: Icons.help),
  ];

  @override
  Widget build(BuildContext context) {
    final TaskController taskcontroller = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 89, 33, 243),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () {
          //     Get.offAllNamed('/');
          //   },
          // ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(child: Obx(() {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: taskcontroller.tasks.length,
              itemBuilder: (context, index) {
                final task = taskcontroller.tasks[index];
                return GridItem(
                    imageUrl: task.imageUrl,
                    title: task.title,
                    onTap: () {
                    },
                    onHold: () {
                      alertUnLike(context, taskcontroller, task.id!);
                    });
              },
            );
          }))
        ],
      ),
    );
  }
}
