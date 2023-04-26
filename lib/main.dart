import 'package:flutter/material.dart';
import 'package:procamera/screens/details_page.dart';
import 'package:procamera/screens/Gallery_Page.dart';
import 'package:procamera/screens/splash_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Splash(),
        'Gallery_page':(context) => GalleryPAge(),
        'details' : (context) => const DetailsPage(),
      },
    ),
  );
}
