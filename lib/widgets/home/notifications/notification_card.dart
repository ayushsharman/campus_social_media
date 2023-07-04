import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colos.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subheading;
  final bool isSeen;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.heading,
    required this.subheading,
    required this.isSeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSeen ? Colors.white : Colors.grey[200],
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.blue,
        ),
        title: Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subheading,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: AppColor.blue,
          ),
        ),
      ),
    );
  }
}
