import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/widgets/btnSocial.dart';
import 'package:latihanpas/widgets/header.dart';
import 'package:latihanpas/app/controllers/postController.dart';
import 'package:latihanpas/widgets/info.dart';

class TeamDetailScreen extends StatelessWidget {
  final String teamName;
  final String stadiumName;
  final String imageUrl;
  final String description;
  final String founded;
  final String capacity;
  final String website;
  final String facebook;

  const TeamDetailScreen({
    Key? key,
    required this.teamName,
    required this.stadiumName,
    required this.imageUrl,
    required this.description,
    required this.founded,
    required this.capacity,
    required this.website,
    required this.facebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final PostController postcontroller = Get.put(PostController());
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 89, 33, 243),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              
              centerTitle: true,
              title: Text(teamName, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTeam(
                    title: 'Stadium',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stadiumName,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Capacity : $capacity',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  HeaderTeam(
                    title: 'Team Information',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Info('Founded', founded),
                        Info('League', 'Premier League'),
                      ],
                    ),
                  ),
                  HeaderTeam(
                    title: 'Social Media',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        btnSocial(
                          icon: Icons.language,
                          onTap: () {}
                        ),
                        btnSocial(
                          icon: Icons.facebook,
                          onTap: () {}
                        ),
                      ],
                    ),
                  ),
                  HeaderTeam(
                    title: 'Description',
                    content: Text( description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 