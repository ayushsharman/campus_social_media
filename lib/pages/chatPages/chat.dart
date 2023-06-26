import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media_campus_app/constant/appColos.dart';
import 'package:social_media_campus_app/pages/homePages/home.dart';
import 'package:social_media_campus_app/widgets/chat/circle_chat.dart';
import 'package:social_media_campus_app/widgets/chat/message_tray.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
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

            //Recent Messages
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent", style: GoogleFonts.poppins(fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircularChats(
                        image: 'assets/Profile Photo (1).png',
                        name: "John Doe",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircularChats(
                        image: 'assets/Profile Photo.png',
                        name: "Lisa Koi",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircularChats(
                        image: 'assets/Profile Photo (2).png',
                        name: "Zoe Lu",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(
              height: .7,
              color: Colors.grey,
            ),

            //Message Tray
            MessageTray(
              name: 'John Doe',
              image: 'assets/Profile Photo.png',
              message: 'hello!',
            ),
            MessageTray(
              name: 'Zoe Lu',
              image: 'assets/Profile Photo (2).png',
              message: 'How are you what have you been doing?',
            ),
            MessageTray(
              name: 'Jacob Williams',
              message: "I'm the king!",
            ),
            MessageTray(
              name: 'Kane',
              image: 'assets/Profile Photo (1).png',
              message: "Meet me on sunday",
            ),
            MessageTray(
              name: 'Undertake',
              message: "Dont' go on sunday",
            ),
          ],
        ),
      ),
    );
  }
}
