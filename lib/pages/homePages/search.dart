import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';

import '../../widgets/home/posts/imagePost.dart';
import '../../widgets/home/posts/textPost.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            //Search Tray
            TextField(
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                hintText: 'Search for people, posts, and text',
                suffixIcon: const Icon(Iconsax.search_normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Title
            Text(
              "Popular",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 10),

            //TabBarView
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonsTabBar(
                      backgroundColor: AppColor.blue,
                      duration: 100,
                      height: 50,
                      contentPadding: const EdgeInsets.all(10),
                      unselectedBackgroundColor: Colors.white,
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      unselectedLabelStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      borderWidth: 1,
                      unselectedBorderColor: Colors.black,
                      radius: 20,
                      tabs: const [
                        Tab(
                          text: '   All   ',
                        ),
                        Tab(
                          text: '   Text   ',
                        ),
                        Tab(
                          text: '   Posts   ',
                        ),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          //All section
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                TextPostCard(
                                  image: 'assets/Profile Photo.png',
                                ),
                                ImagePostCard(
                                  post: "assets/post.png",
                                  image: "assets/Profile Photo (1).png",
                                ),
                                ImagePostCard(
                                  post: "assets/post.png",
                                  image: "assets/Profile Photo (2).png",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
