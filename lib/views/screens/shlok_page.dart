import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramayan_app/utils/list.dart';
import '../../modals/hc.modal.dart';

class ShloksPage extends StatefulWidget {
  const ShloksPage({Key? key}) : super(key: key);

  @override
  State<ShloksPage> createState() => _ShloksPageState();
}

class _ShloksPageState extends State<ShloksPage> {
  String? data;

  List<Shloka> Shlok = [];

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {

    data = await rootBundle.loadString("${ramayanKand[index]['json']}");

    setState(() {
      List decodeList = jsonDecode(data!);
      Shlok = decodeList
          .map((e) => Shloka.fromMap(data: e))
          .toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("${ramayanKand[index]['name']}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "${ramayanKand[index]['image']}",
                ),
              ),),
            ),
            SizedBox(
              height: 10,
            ),
            (Shlok.isEmpty)
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: Shlok.length,
                      itemBuilder: (context, i) => Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed('detail_page', arguments: Shlok[i]);
                            },
                            leading: Text("${Shlok[i].verse}"),
                            title: Text("${Shlok[i].san}"),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
