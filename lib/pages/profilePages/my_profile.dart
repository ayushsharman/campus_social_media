import 'dart:io';
import 'package:Feeleeria/pages/profilePages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant/app_colos.dart';
import '../../widgets/home/posts/imagePost.dart';
import '../../widgets/home/posts/textPost.dart';
import '../../widgets/profile/analytics_count.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _imagePicker = ImagePicker();
  XFile? _profileImage;
  XFile? _bannerImage;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        setState(() {
          _userName = userSnapshot.get('name');
        });
      }
    } catch (e) {
      print('Error while fetching user data: $e');
    }
  }

  Future<XFile?> _pickImage() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      print('Error while picking image: $e');
      return null;
    }
  }

  Widget _buildDefaultImageWidget(XFile? imageFile) {
    return imageFile != null
        ? CircleAvatar(
            radius: 60,
            backgroundImage: FileImage(File(imageFile.path)),
          )
        : Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColor.orange, AppColor.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'No Image',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
  }

  void _pickBannerPicture() async {
    final XFile? imageFile = await _pickImage();
    if (imageFile != null) {
      setState(() {
        _bannerImage = imageFile;
      });
    }
  }

  void _pickProfilePicture() async {
    final XFile? imageFile = await _pickImage();
    if (imageFile != null) {
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: _pickBannerPicture,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColor.orange, AppColor.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      image: _bannerImage != null
                          ? DecorationImage(
                              image: FileImage(File(_bannerImage!.path)),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage('assets/Profile Banner.jpg'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: const Icon(Iconsax.setting),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    },
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userName ?? 'Your Name',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Chandigarh University",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Profile Picture
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0, right: 8),
                      child: GestureDetector(
                        onTap: _pickProfilePicture,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [AppColor.blue, Colors.deepPurple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: _buildDefaultImageWidget(
                                _profileImage), // Replace _profileImage with the profile image URL from Firestore
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Bio
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Coder by Profession. Artist by Passion!",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.italic,
                  color: AppColor.blue,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider(height: 1, color: Colors.black),
            const SizedBox(height: 16),

            // Analytics bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnalyticsCount(count: 24148, metric: "Followers"),
                AnalyticsCount(count: 123, metric: "Following"),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 16),

            // Tab Bar
            TabBar(
              labelColor: Colors.black,
              indicatorWeight: 3,
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              controller: _tabController,
              indicatorColor: AppColor.blue,
              tabs: const [
                Tab(text: 'Posts'),
                Tab(text: 'Text'),
                Tab(text: 'Story'),
              ],
            ),

            // Tab Bar View
            SizedBox(
              height: 400, // Adjust the height as needed
              child: TabBarView(
                controller: _tabController,
                children: [
                  //Posts/System section
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ImagePostCard(
                          name: _userName,
                          post: "assets/post.png",
                          image: "assets/Profile Photo (1).png",
                        ),
                        ImagePostCard(
                          name: _userName,
                          post: "assets/post.png",
                          image: "assets/Profile Photo (1).png",
                        ),
                        ImagePostCard(
                          name: _userName,
                          post: "assets/post.png",
                          image: "assets/Profile Photo (1).png",
                        ),
                      ],
                    ),
                  ),

                  //Text Section
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        TextPostCard(
                          image: 'assets/Profile Photo (1).png',
                        ),
                        TextPostCard(
                          image: 'assets/Profile Photo.png',
                        ),
                        TextPostCard(
                          image: 'assets/Profile Photo (2).png',
                        ),
                        TextPostCard(
                          image: 'assets/Profile Photo.png',
                        ),
                        TextPostCard(
                          image: 'assets/Profile Photo.png',
                        ),
                      ],
                    ),
                  ),

                  Center(child: Text('Hello')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
