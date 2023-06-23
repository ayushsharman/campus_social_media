import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../pages/chat.dart';
import '../pages/home.dart';
import '../pages/system.dart';
import '../pages/text.dart';
import '../pages/upload.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          SystemPage(),
          HomePage(),
          UploadPage(),
          ChatPage(),
          TextPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 88,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(62, 142, 227, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Iconsax.arrow_left),
              color: Colors.white,
              onPressed: () => onTabSelected(0),
            ),
            IconButton(
              icon: const Icon(
                Iconsax.home,
              ),
              color: Colors.white,
              onPressed: () => onTabSelected(1),
              // Set index 1 as selected
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 92, 0, 1),
              ),
              child: IconButton(
                icon: const Icon(Iconsax.add),
                color: Colors.white,
                onPressed: () => onTabSelected(2),
                // Set index 2 as selected
              ),
            ),
            IconButton(
              icon: const Icon(Iconsax.messages_24),
              color: Colors.white,
              onPressed: () => onTabSelected(3),
              // Set index 3 as selected
            ),
            IconButton(
              icon: const Icon(Iconsax.arrow_right_1),
              color: Colors.white,
              onPressed: () => onTabSelected(4),
              // Set index 4 as selected
            ),
          ],
        ),
      ),
    );
  }
}
