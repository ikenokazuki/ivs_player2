import 'package:flutter/material.dart';
import 'package:ivs_player2/ivs_player2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    IvsPlayer2().playStream(
        'https://fcc3ddae59ed.us-west-2.playback.live-video.net/api/video/v1/us-west-2.893648527354.channel.YtnrVcQbttF0.m3u8');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IVS Player Example'),
        ),
      ),
    );
  }
}
