import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    String image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Image"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.87,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.6)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
