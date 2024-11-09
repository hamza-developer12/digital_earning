import 'package:flutter/material.dart';


class CustomAccountCard extends StatelessWidget {
  final String name;
  final String email;
  final String registrationDate;
  const CustomAccountCard({super.key,
    required this.name,
    required this.email,
    required this.registrationDate
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 78,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Name"),
                    SizedBox(width: width* 0.01,),
                    Text(name, style: textValueStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Email"),
                    SizedBox(width: width* 0.01,),
                    Expanded(child: Text(email, style: textValueStyle))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("User ID"),
                    SizedBox(width: width* 0.01,),
                    Text("*****", style: textValueStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Registration Date"),
                    Text(registrationDate, style: textValueStyle,)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
TextStyle textValueStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
);