import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/list.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ramayan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
            ),
            items: images
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('ramcharitmanas_page');
            },
            child: Container(
              height: 50,
              width: w * 0.9,
              alignment: Alignment.center,
              child: Text(
                "Shree Ramcharitmanas",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('hanumanchalisa_page');
            },
            child: Container(
              height: 50,
              width: w * 0.9,
              alignment: Alignment.center,
              child: Text(
                "Hanuman Chalisa",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('name_page');
            },
            child: Container(
              height: 50,
              width: w * 0.9,
              alignment: Alignment.center,
              child: Text(
                "108 Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
