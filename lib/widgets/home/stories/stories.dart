import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class StoryIcon extends StatelessWidget {
  final List<String> images;

  const StoryIcon({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stories(
      spaceBetweenStories: 10,
      storyCircleTextStyle: GoogleFonts.poppins(),
      highLightColor: Colors.blueAccent,
      displayProgress: true,
      storyItemList: [
        // First group of stories
        StoryItem(
          name: "Lisa",
          thumbnail: AssetImage(images[0]),
          stories: [
            Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://wallpaperaccess.com/full/16568.png",
                    ),
                  ),
                ),
              ),
            ),
            // Second story in first group
            const Scaffold(
              body: Center(
                child: Text(
                  "Second story in first group!",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Second story group
        StoryItem(
          name: "John",
          thumbnail: AssetImage(images[1]),
          stories: [
            const Scaffold(
              body: Center(
                child: Text(
                  "That's it, Folks!",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Third story group
        StoryItem(
          name: "Lisa",
          thumbnail: AssetImage(images[2]),
          stories: [
            const Scaffold(
              body: Center(
                child: Text(
                  "Bs bhai bahut hogya",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
