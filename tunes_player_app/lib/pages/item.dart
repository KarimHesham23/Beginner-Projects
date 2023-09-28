import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tunes_player_app/models/item_model.dart';

class TuneItem extends StatelessWidget {
  const TuneItem({super.key, required this.element});
  final ItemModel element;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          var player = AudioPlayer();
          player.play(AssetSource(element.sound));
        },
        child: Container(
          width: double.infinity,
          color: element.color,
        ),
      ),
    );
  }
}
