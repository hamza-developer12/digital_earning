import 'package:flutter/material.dart';


class DefaultUserPageLayout extends StatelessWidget {
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final IconData icon;
  final String screenName;
  final Widget child;
  const DefaultUserPageLayout({
    super.key,
    required this.backgroundColor,
    required this.appBarBackgroundColor,
    required this.icon,
    required this.screenName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height* 0.02,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: appBarBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Row(
                  children: [
                    Icon(icon, size: 25),
                    SizedBox(width: width * 0.01),
                    Text(screenName, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 25,
                        ))
                  ],
                ),
              ),
            ),
          SizedBox(height: height * 0.01,),
          //   Rest of the screen ui here............
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
