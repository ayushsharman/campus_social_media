// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_colos.dart';

// ignore: must_be_immutable
class AnalyticsCount extends StatelessWidget {
  int count;
  String metric;
  AnalyticsCount({
    Key? key,
    required this.count,
    required this.metric,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(count.toString(),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
      Text(metric,
          style: GoogleFonts.poppins(
            color: AppColor.blue,
            fontSize: 18,
          )),
    ]);
  }
}
