import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';

class TextPostCard extends StatelessWidget {
  final String image;

  const TextPostCard({
    Key? key,
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
                      'Lisa Kio',
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
            Text(
              '“If you think you are too small to make a difference, try sleeping with a mosquito.”\n~ Dalai Lama',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
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
                            AssetImage('assets/broken heart.png'),
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
