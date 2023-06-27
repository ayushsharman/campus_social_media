import 'package:flutter/material.dart';
import 'package:social_media_campus_app/widgets/home/custom_appbar.dart';
import 'package:social_media_campus_app/widgets/home/posts/imagePost.dart';
import 'package:social_media_campus_app/widgets/home/stories/stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),

            //Custom App Bar
            CustomAppBar(
              name: "Feeleeria",
            ),

            //Story section
            const SizedBox(
              height: 20,
            ),
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

            //Post section
            const ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo (1).png",
            ),
            const ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo.png",
            ),
            const ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo.png",
            ),
          ],
        ),
      ),
    );
  }
}
