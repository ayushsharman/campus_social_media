import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:social_media_campus_app/pages/homePages/notifications.dart';
import 'package:social_media_campus_app/pages/homePages/search.dart';
import 'package:social_media_campus_app/pages/profilePages/my_profile.dart';
import 'package:social_media_campus_app/widgets/home/posts/imagePost.dart';
import 'package:social_media_campus_app/widgets/home/posts/textPost.dart';
import 'package:social_media_campus_app/widgets/home/stories/stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Feeleeria',
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //Story section
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: StoryIcon(
                images: [
                  'assets/Profile Photo.png',
                  'assets/Profile Photo (1).png',
                  'assets/Profile Photo (2).png',
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),

            //Post section
            TextPostCard(
              image: 'assets/Profile Photo.png',
            ),
            ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo (1).png",
            )
          ],
        ),
      ),
    );
  }
}
