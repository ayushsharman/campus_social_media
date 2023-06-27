import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:social_media_campus_app/pages/homePages/search.dart';
import 'package:social_media_campus_app/widgets/home/custom_appbar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../widgets/home/posts/imagePost.dart';
import '../profilePages/my_profile.dart';
import 'notifications.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          CustomAppBar(name: 'System'),
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
