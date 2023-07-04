import 'package:flutter/material.dart';

import '../../widgets/home/custom_appbar.dart';
import '../../widgets/home/posts/imagePost.dart';
import '../../widgets/home/stories/stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),

            //Custom App Bar
            CustomAppBar(
              name: "Feeleeria",
            ),

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
            ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo (1).png",
            ),
            ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo.png",
            ),
            ImagePostCard(
              post: "assets/post.png",
              image: "assets/Profile Photo.png",
            ),
          ],
        ),
      ),
    );
  }
}
