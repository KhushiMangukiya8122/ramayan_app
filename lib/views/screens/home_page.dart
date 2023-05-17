import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 500,
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  color: Colors.orange,

                ),
              ),
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.orangeAccent,
              ),
              CircleAvatar(
                radius: 140,
                backgroundColor: Colors.orangeAccent.shade100,
              ),
              CircleAvatar(
                radius: 130,
              ),
              CircleAvatar(
                radius: 120,
                backgroundColor: Colors.orange,
                foregroundImage: AssetImage("assets/images/ram.png"),
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('first_page');
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade100,
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                Container(
                  height: 55,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade200,
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                Container(
                  height: 40,
                  width: 140,
                  alignment: Alignment.center,
                  child: Text("Next →",style: TextStyle(fontSize: 25),),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
