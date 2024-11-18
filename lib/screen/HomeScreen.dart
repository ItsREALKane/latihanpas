import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/controllers/alertDialog.dart';
import 'package:latihanpas/app/controllers/postController.dart';
import 'package:latihanpas/app/models/taskModel.dart';
import 'package:latihanpas/screen/teamDetailScreen.dart';
import 'package:latihanpas/widgets/gridItem.dart';

// Model untuk menu item
class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});
}

class HomePage extends StatelessWidget {

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: postcontroller.postList.length,
          itemBuilder: (context, index) {
            final post = postcontroller.postList[index];
            return GridItem(
              imageUrl: post.strBadge,
              title: post.strTeam,
              onTap: () { 
                Get.to(() => TeamDetailScreen(
                  teamName: post.strTeam,
                  stadiumName: post.strStadium,
                  imageUrl: post.strBadge,
                  description: post.strDescriptionEn,
                  founded: post.intFormedYear,
                  capacity: post.intStadiumCapacity,
                  website: post.strWebsite,
                  facebook: post.strFacebook,
                ));
              },
              onHold: () { 
                TaskModel task = TaskModel(
                              title: post.strTeam,
                              description: post.strStadium,
                              imageUrl: post.strBadge);
                          alertLike(context, task);
               },
            );
          },
        ),
      ),
    );
  }
}