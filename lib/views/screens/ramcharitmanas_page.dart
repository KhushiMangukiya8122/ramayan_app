import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramayan_app/modals/hc.modal.dart';

import '../../utils/list.dart';

class RamcharitmanasPage extends StatefulWidget {
  const RamcharitmanasPage({Key? key}) : super(key: key);

  @override
  State<RamcharitmanasPage> createState() => _RamcharitmanasPageState();
}

class _RamcharitmanasPageState extends State<RamcharitmanasPage> {


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
                height: 300,
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  color: Colors.orange,
                ),
              ),
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ramcharit.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: ramayanKand.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      index = i;
                      Navigator.of(context).pushNamed("shlok_page");
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [

                        Container(
                          height: 125,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("${ramayanKand[i]['image']}"),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${ramayanKand[i]['name']}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




