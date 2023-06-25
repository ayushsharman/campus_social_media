import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../widgets/home/posts/imagePost.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<SystemPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'System',
            style: GoogleFonts.sail(
              fontSize: 40,
              color: AppColor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Iconsax.profile_circle,
            color: Colors.black,
          ),
          onPressed: () {
            // Add your profile icon button action here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.search_favorite,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your search icon button action here
            },
          ),
          IconButton(
            icon: const Icon(
              Iconsax.notification,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your notification icon button action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(25),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                indicatorColor: AppColor.orange,
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'Trending',
                  ),
                  Tab(
                    text: 'Latest',
                  ),
                ],
                indicator: RectangularIndicator(
                  color: AppColor.blue,
                  paintingStyle: PaintingStyle.fill,
                  topLeftRadius: 25,
                  topRightRadius: 25,
                  bottomLeftRadius: 25,
                  bottomRightRadius: 25,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Trending Content (ImagePostCard)
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Latest Content (ImagePostCard)
                      ImagePostCard(
                        post: "assets/post.png",
                        image: "assets/Profile Photo.png",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
