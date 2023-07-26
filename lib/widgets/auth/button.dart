// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:Feeleeria/constant/app_colos.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function onpressed;
  CustomButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
          onPressed: () => onpressed(),
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
              backgroundColor: MaterialStatePropertyAll(AppColor.orange)),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
