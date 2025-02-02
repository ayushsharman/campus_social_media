// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../constant/app_colos.dart';
import '../../widgets/home/custom_appbar.dart';
import '../../widgets/home/posts/imagePost.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage>
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
          const CustomAppBar(
            name: "System",
            isSystem: true,
          ),
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
                    text: 'Campus',
                  ),
                  Tab(
                    text: 'Nearby',
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
                      Padding(
                        padding: EdgeInsets.only(top: 160.0),
                        child: Icon(
                          Iconsax.warning_24,
                          size: 160,
                        ),
                      ),
                      Text(
                        "No Data Found",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Latest Content (TextPostCard)
                      ImagePostCard(
                        post: "assets/post.png",
                        image: "assets/Profile Photo (1).png",
                      ),
                      ImagePostCard(
                        post: "assets/post.png",
                        image: "assets/Profile Photo (1).png",
                      ),
                      ImagePostCard(
                        post: "assets/post.png",
                        image: "assets/Profile Photo (1).png",
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
