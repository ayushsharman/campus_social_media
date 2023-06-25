// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_campus_app/constant/appColos.dart';

class MessageTray extends StatelessWidget {
  String name;
  String message;
  String? image;
  MessageTray({
    Key? key,
    required this.name,
    required this.message,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image ?? "assets/blank profile.png"),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColor.orange,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '4h ago',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColor.blue,
            ),
          ),
        ],
      ),
    );
  }
}
