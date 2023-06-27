// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../constant/appColos.dart';
import '../../widgets/home/custom_appbar.dart';
import '../../widgets/home/posts/textPost.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          CustomAppBar(name: "Text"),
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
