// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';
import '../../widgets/home/posts/imagePost.dart';
import '../../widgets/home/posts/textPost.dart';
import '../../widgets/profile/analytics_count.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
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

                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Icon(
                    Iconsax.save_2,
                    size: 40,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name heading
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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

            const SizedBox(height: 10),

            // Bio
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
            const Divider(height: 1, color: Colors.black),
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
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
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
    );
  }
}
