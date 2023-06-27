// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:social_media_campus_app/widgets/home/posts/imagePost.dart';
import 'package:social_media_campus_app/widgets/home/stories/stories.dart';

import '../../constant/appColos.dart';
import '../../pages/homePages/notifications.dart';
import '../../pages/homePages/search.dart';
import '../../pages/profilePages/my_profile.dart';

class CustomAppBar extends StatelessWidget {
  String name;
  CustomAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Iconsax.profile_circle,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
              ),
              Text(
                name,
                style: GoogleFonts.sail(
                  fontSize: 40,
                  color: AppColor.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Iconsax.search_favorite,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()),
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
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: StoryIcon(
            images: [
              'assets/Profile Photo.png',
              'assets/Profile Photo (1).png',
              'assets/Profile Photo (2).png',
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        const ImagePostCard(
          post: "assets/post.png",
          image: "assets/Profile Photo (1).png",
        ),
        const ImagePostCard(
          post: "assets/post.png",
          image: "assets/Profile Photo.png",
        ),
      ],
    );
  }
}
