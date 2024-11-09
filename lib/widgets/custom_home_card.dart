import 'package:flutter/material.dart';

class CustomHomeCard extends StatelessWidget {
  final Color color;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const CustomHomeCard({super.key,
    required this.color,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      // height: 78,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text1, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
                Text(text2, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text3, style:const TextStyle(
                  fontSize: 16,
                ),
                ),
                Text(text4, style: const TextStyle(
                  fontSize: 16,
                ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
