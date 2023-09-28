import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/item_phrease_model.dart';

class ItemPhrases extends StatelessWidget {
  const ItemPhrases({super.key, required this.data, required this.color});
  final ItemPhrasesModels data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.jData,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  data.eData,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {
              var player = AudioPlayer();
              player.play(AssetSource(data.sound));
            },
            icon: const Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
