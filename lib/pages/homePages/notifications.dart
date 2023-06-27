import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/appColos.dart';
import '../../widgets/home/notifications/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            //Top Row
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alerts',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mark all as read',
                    style: GoogleFonts.poppins(
                      letterSpacing: .2,
                      fontSize: 24,
                      color: AppColor.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //Timeline
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Text(
                'TODAY',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColor.blue,
                ),
              ),
            ),

            //Notification Cards
            const NotificationCard(
              icon: Icons.favorite,
              heading: 'Sofia, John and 5 others liked your post',
              subheading: '10m ago',
              isSeen: false,
            ),
            const NotificationCard(
              icon: Icons.favorite,
              heading: 'Rebecca, Lisa and 1 others liked your post',
              subheading: '20m ago',
              isSeen: false,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0),
              child: Text(
                'YESTERDAY',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColor.blue,
                ),
              ),
            ),

            const NotificationCard(
              icon: Icons.favorite,
              heading: 'Ralph followed you',
              subheading: '1 day ago',
              isSeen: true,
            ),
            const NotificationCard(
              icon: Icons.favorite,
              heading: 'Katrina Commented on your post',
              subheading: '1 day ago',
              isSeen: true,
            ),
          ],
        ),
      ),
    );
  }
}
