import 'dart:convert';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Components/provider/song_provider.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  String? data1;

  Map raamName = {};

  @override
  void initState() {
    super.initState();
    loadJSON();
    Provider.of<SongProvider>(context, listen: false)
        .songModel
        .assetsAudioPlayer
        .open(
      Audio("assets/audio/Ram_Siya_Ram.mp3"),
      showNotification: true,
      autoStart: Provider.of<SongProvider>(context, listen: false)
          .songModel
          .isPlay,
    );
  }

  Future<void> loadJSON() async {
    data1 = await rootBundle.loadString('assets/json/ram_name.json');
  }

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
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 75,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.orange,
                        foregroundImage: AssetImage("assets/images/ram.png"),
                      ),
                    ],
                  ),
                  Text(
                    "108 Name",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Shree Raam",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "108 Name of Shre Raam",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              raamName = jsonDecode(data1!);
                            });
                          },
                          icon: Icon(
                            Icons.arrow_circle_down,
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: Provider.of<SongProvider>(context)
                          .songModel
                          .assetsAudioPlayer
                          .currentPosition,
                      builder: (context, snapshot) {
                        Provider.of<SongProvider>(context)
                            .songModel
                            .currentSliderValue =
                        (snapshot.data != null)
                            ? snapshot.data!
                            : const Duration(seconds: 0);

                        try {
                          Provider.of<SongProvider>(context)
                              .songModel
                              .totalDuration =
                              Provider.of<SongProvider>(context, listen: false)
                                  .songModel
                                  .assetsAudioPlayer
                                  .current
                                  .value
                                  ?.audio
                                  .duration;
                        } catch (e) {
                          Provider.of<SongProvider>(context, listen: false)
                              .songModel
                              .totalDuration = const Duration(seconds: 0);
                        }

                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                              ],
                            ),
                            Slider(
                              activeColor: Colors.orangeAccent,
                              min: 0,
                              max: Provider.of<SongProvider>(context,
                                  listen: false)
                                  .songModel
                                  .totalDuration!
                                  .inSeconds
                                  .toDouble(),
                              value: Provider.of<SongProvider>(context)
                                  .songModel
                                  .currentSliderValue
                                  .inSeconds
                                  .toDouble(),
                              onChanged: (val) {
                                Provider.of<SongProvider>(context,
                                    listen: false)
                                    .songModel
                                    .assetsAudioPlayer
                                    .seek(
                                  Duration(seconds: val.toInt()),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Provider.of<SongProvider>(context)
                                    .songModel
                                    .currentSliderValue
                                    .toString()
                                    .split('.')[0]),
                                Text(Provider.of<SongProvider>(context,
                                    listen: false)
                                    .songModel
                                    .totalDuration!
                                    .toString()
                                    .split('.')[0]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    if (Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .isPlay ==
                                        false) {
                                      Provider.of<SongProvider>(context,
                                          listen: false)
                                          .playSong();
                                    }

                                    await Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .assetsAudioPlayer
                                        .previous();
                                  },
                                  icon: const Icon(Icons.skip_previous),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Provider.of<SongProvider>(context,
                                        listen: false)
                                        .playSong();
                                    await Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .assetsAudioPlayer
                                        .playOrPause();
                                  },
                                  icon: (Provider.of<SongProvider>(context)
                                      .songModel
                                      .isPlay)
                                      ? const Icon(
                                    Icons.pause_circle_outline,
                                    size: 40,
                                  )
                                      : const Icon(
                                    Icons.play_circle_outline,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .isPlay ==
                                        false) {
                                      Provider.of<SongProvider>(context,
                                          listen: false)
                                          .playSong();
                                    }

                                    await Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .assetsAudioPlayer
                                        .next();
                                  },
                                  icon: const Icon(Icons.skip_next),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Provider.of<SongProvider>(context,
                                        listen: false)
                                        .muteSong();
                                    (Provider.of<SongProvider>(context,
                                        listen: false)
                                        .songModel
                                        .isMute)
                                        ? await Provider.of<SongProvider>(
                                        context,
                                        listen: false)
                                        .songModel
                                        .assetsAudioPlayer
                                        .setVolume(0)
                                        : await Provider.of<SongProvider>(
                                        context,
                                        listen: false)
                                        .songModel
                                        .assetsAudioPlayer
                                        .setVolume(1);
                                  },
                                  icon: (Provider.of<SongProvider>(context,
                                      listen: false)
                                      .songModel
                                      .isMute)
                                      ? const Icon(Icons.volume_off)
                                      : const Icon(Icons.volume_up),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    (raamName.isEmpty)
                        ? Container()
                        : Column(
                      children: [
                        Text(
                          "${raamName['san']}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
