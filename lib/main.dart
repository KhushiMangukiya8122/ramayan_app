import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramayan_app/views/screens/home_page.dart';
import 'package:ramayan_app/views/screens/splash_screen.dart';
import 'package:ramayan_app/views/screens/first_page.dart';
import 'package:ramayan_app/views/screens/ramcharitmanas_page.dart';
import 'package:ramayan_app/views/screens/hanumanchalisa_page.dart';
import 'package:ramayan_app/views/screens/name_page.dart';
import 'package:ramayan_app/views/screens/shlok_page.dart';
import 'package:ramayan_app/views/screens/detail_page.dart';

import 'Components/provider/song_provider.dart';
import 'modals/song_modal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(
            songModel: SongModel(
              isPlay: false,
              isMute: false,
              assetsAudioPlayer: AssetsAudioPlayer(),
              currentSliderValue: const Duration(seconds: 0),
            ),
          ),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          routes: {
            '/': (context) => SplashScreen(),
            'home_page': (context) => HomePage(),
            'first_page': (context) => Firstpage(),
            'ramcharitmanas_page': (context) => RamcharitmanasPage(),
            'hanumanchalisa_page': (context) => HanumanChalisaPage(),
            'name_page': (context) => NamePage(),
            'shlok_page': (context) => ShloksPage(),
            'detail_page': (context) => DetailsPage(),
          },
        );
      },
    ),
  );
}





