// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:social_media_campus_app/widgets/profile/analytics_count.dart';

import '../../widgets/home/posts/imagePost.dart';
import '../../widgets/home/posts/textPost.dart';

// ignore: must_be_immutable
class ViewProfilePage extends StatefulWidget {
  String name;
  ViewProfilePage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  // Banner
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Profile Banner.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name heading
                      Padding(
                        padding: const EdgeInsets.only(top: 220.0, left: 60),
                        child: Column(
                          children: [
                            Text(
                              "Elizabeth Olsen",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Brooklyn NYK",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Profile Picture
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0, right: 8),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [AppColor.blue, Colors.deepPurple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage('assets/Profile.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Bio
              Center(
                child: Text(
                  "Coder by Profession. Artist by Passion!",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.italic,
                    color: AppColor.blue,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Divider(height: .4, color: Colors.black),
              const SizedBox(height: 16),

              // Analytics bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnalyticsCount(count: 24148, metric: "Followers"),
                  AnalyticsCount(count: 123, metric: "Following"),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Follow',
                      style: GoogleFonts.poppins(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Tab Bar
              TabBar(
                labelColor: Colors.black,
                indicatorWeight: 3,
                labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18),
                controller: _tabController,
                indicatorColor: AppColor.blue,
                tabs: const [
                  Tab(text: 'Posts'),
                  Tab(text: 'Text'),
                  Tab(text: 'Story'),
                ],
              ),

              // Tab Bar View
              SizedBox(
                height: 400, // Adjust the height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    //Posts/System section
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ImagePostCard(
                            post: "assets/post.png",
                            image: "assets/Profile Photo (1).png",
                          ),
                          ImagePostCard(
                            post: "assets/post.png",
                            image: "assets/Profile Photo (2).png",
                          ),
                          ImagePostCard(
                            post: "assets/post.png",
                            image: "assets/Profile Photo.png",
                          ),
                          ImagePostCard(
                            post: "assets/post.png",
                            image: "assets/Profile Photo (1).png",
                          ),
                        ],
                      ),
                    ),

                    //Text Section
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          TextPostCard(
                            image: 'assets/Profile Photo (1).png',
                          ),
                          TextPostCard(
                            image: 'assets/Profile Photo.png',
                          ),
                          TextPostCard(
                            image: 'assets/Profile Photo (2).png',
                          ),
                          TextPostCard(
                            image: 'assets/Profile Photo.png',
                          ),
                          TextPostCard(
                            image: 'assets/Profile Photo.png',
                          ),
                        ],
                      ),
                    ),

                    Center(child: Text('Hello')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
