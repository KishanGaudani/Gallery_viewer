import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Gallery_Page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const GalleryPAge()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            "https://cdn191.picsart.com/232218253013202.jpg",
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text("Gallery APP",style: GoogleFonts.itim(fontSize: 70,color: Colors.white),),
          const Spacer(),
          LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 50),
          const Spacer(),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
