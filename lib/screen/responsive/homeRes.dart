import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/controllers/alertDialog.dart';
import 'package:latihanpas/app/controllers/postController.dart';
import 'package:latihanpas/widgets/gridItem.dart';

// Model untuk menu item
class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});
}

class HomePageRes extends StatelessWidget {

  final PostController postcontroller = Get.put(PostController());

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
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
      body: Obx(() {
        if (postcontroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postcontroller.postList.length,
          itemBuilder: (context, index) {
            final post = postcontroller.postList[index];
            return Card(
              child: ListTile(
                leading: Image.network(post.strBadge),
                title: Text(post.strTeam),
                subtitle: Text(post.strStadium),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {},
                ),
              ),
            );
          },
        );
      }),
    );
  }
}