// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/home/custom_appbar.dart';

class SystemPage extends StatelessWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),

            //CustomAppBar
            const CustomAppBar(
              name: 'System',
              isSystem: true,
            ),
            const SizedBox(
              height: 10,
            ),

            //No data
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 160.0),
                  child: Icon(
                    Iconsax.warning_24,
                    size: 160,
                  ),
                ),
                Text(
                  "No Data Found",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 40),
                )
              ],
            ),

            //Posts when data
          ],
        ),
      ),
    );
  }
}
