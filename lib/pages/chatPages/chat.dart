import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';
import '../../navigation/navBar.dart';
import '../../widgets/chat/circle_chat.dart';
import '../../widgets/chat/message_tray.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: const Icon(
              Iconsax.arrow_circle_left5,
              color: AppColor.blue,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNav()),
              );
            },
          ),
        ),
        title: Center(
          child: Text(
            "Messages",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Iconsax.setting5,
                color: AppColor.blue,
                size: 30,
              ),
              onPressed: () {
                // Handle back button press
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            //Search Icon
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(),
                  hintText: 'Who do you want to chat with?',
                  suffixIcon: const Icon(Iconsax.search_normal),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            //Divider
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 15),

            // Use FutureBuilder to fetch user data from Firestore
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.collection('users').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Handle any errors that occur while fetching data
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Process the fetched data
                  final userData = snapshot.data!.docs
                      .map((doc) => doc.data())
                      .where((data) =>
                          data['uid'] !=
                          FirebaseAuth.instance.currentUser
                              ?.uid) // Compare user ID to exclude current user
                      .toList();

                  // Exclude current user data from the list
                  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
                  final filteredUserData = userData
                      .where((data) => data['uid'] != currentUserId)
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: filteredUserData.length,
                                itemBuilder: (context, index) {
                                  final userDataItem = filteredUserData[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircularChats(
                                      image: 'assets/Profile Photo.png',
                                      name: userDataItem['name'],
                                      // Use the email if you need it for MessageTray
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        height: .7,
                        color: Colors.grey,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredUserData.length,
                        itemBuilder: (context, index) {
                          final userDataItem = filteredUserData[index];
                          return MessageTray(
                            name: userDataItem['name'],
                            image: 'assets/Profile Photo.png',
                            message: 'hello!',
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
