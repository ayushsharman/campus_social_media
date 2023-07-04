// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';
import '../../pages/homePages/notifications.dart';
import '../../pages/homePages/search.dart';
import '../../pages/profilePages/my_profile.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final bool? isSystem;

  const CustomAppBar({
    Key? key,
    required this.name,
    this.isSystem,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Text(
                      name,
                      style: GoogleFonts.sail(
                        fontSize: 40,
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isSystem ?? false)
                    PopupMenuButton<String>(
                      itemBuilder: (context) => [
                        PopupMenuItem<String>(
                          value: 'Campus 1',
                          child: Text(
                            'Campus 1',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Campus 2',
                          child: Text(
                            'Campus 2',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Campus 3',
                          child: Text(
                            'Campus 3',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Not Listed',
                          child: Text(
                            'Not Listed',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      child: const Icon(
                        Iconsax.arrow_circle_down,
                        color: Colors.black,
                      ),
                    ),
                ],
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
      ],
    );
  }
}
