import 'dart:convert';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:ramayan_app/modals/hc.modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Components/provider/song_provider.dart';

class HanumanChalisaPage extends StatefulWidget {
  const HanumanChalisaPage({Key? key}) : super(key: key);

  @override
  State<HanumanChalisaPage> createState() => _HanumanChalisaPageState();
}

class _HanumanChalisaPageState extends State<HanumanChalisaPage> {
  String? data;

  Map hanumanChalisa = {};

  @override
  void initState() {
    super.initState();
    loadJSON();
    Provider.of<SongProvider>(context, listen: false)
        .songModel
        .assetsAudioPlayer
        .open(
          Audio("assets/audio/Song-13.mp3"),
          showNotification: true,
          autoStart: Provider.of<SongProvider>(context, listen: false)
              .songModel
              .isPlay,
        );
  }

  Future<void> loadJSON() async {
    data = await rootBundle.loadString('assets/json/hanuman_chalisa.json');
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // dart page ma jaya jaya
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
                      "assets/images/hanuman.png",
                    ),
                  ),
                ),
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
                          "श्री हनुमान चालीसा",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              hanumanChalisa = jsonDecode(data!);
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
                                Container(
                                  height: 200,
                                  width: w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/ramayanKand/r8.jpg"),
                                    ),
                                  ),
                                ),
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
                    (hanumanChalisa.isEmpty)
                        ? Container()
                        : Column(
                            children: [
                              Text(
                                "${hanumanChalisa['san']}",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                height: 200,
                                width: w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/ramayanKand/r8.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${hanumanChalisa['guj']}",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                height: 200,
                                width: w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/3.jpg"),
                                  ),
                                ),
                              ),
                              Text(
                                "${hanumanChalisa['hin']}",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                height: 200,
                                width: w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/r8.jpg"),
                                  ),
                                ),
                              ),
                              Text(
                                "${hanumanChalisa['eng']}",
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
