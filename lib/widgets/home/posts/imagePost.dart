import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';

class ImagePostCard extends StatelessWidget {
  final String post;
  final String image;

  const ImagePostCard({
    Key? key,
    required this.post,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '20m ago',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColor.blue,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColor.blue,
                  ),
                  onPressed: () {
                    // Handle the icon click
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Image.asset(
              post,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage('assets/heart.png'),
                          ),
                          onPressed: () {
                            // Handle like button click
                          },
                        ),
                        Text(
                          "120",
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Iconsax.message),
                          onPressed: () {
                            // Handle comment button click
                          },
                        ),
                        Text(
                          "45",
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/hand shake.png'),
                      ),
                      onPressed: () {
                        // Handle like button click
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Iconsax.send_2),
                      onPressed: () {
                        // Handle DM button click
                      },
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.share5),
                      onPressed: () {
                        // Handle share button click
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
