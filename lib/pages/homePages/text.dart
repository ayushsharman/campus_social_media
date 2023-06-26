import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:social_media_campus_app/pages/homePages/search.dart';
import 'package:social_media_campus_app/widgets/home/posts/textPost.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../profilePages/my_profile.dart';
import 'notifications.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage>
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
            'Text',
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.search_favorite,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Iconsax.notification,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
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
                      // Trending Content (TextPostCard)
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Latest Content (TextPostCard)
                      TextPostCard(
                        image: 'assets/Profile Photo (1).png',
                      ),
                      TextPostCard(
                        image: 'assets/Profile Photo.png',
                      ),
                      TextPostCard(
                        image: 'assets/Profile Photo.png',
                      ),
                      TextPostCard(
                        image: 'assets/Profile Photo.png',
                      ),
                      TextPostCard(
                        image: 'assets/Profile Photo (2).png',
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
