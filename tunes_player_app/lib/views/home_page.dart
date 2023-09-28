import 'package:flutter/material.dart';
import 'package:tunes_player_app/models/item_model.dart';
import 'package:tunes_player_app/pages/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<ItemModel> data = const [
    ItemModel(Color(0xffFE4039), "note1.wav"),
    ItemModel(Color(0xffFD982B), "note2.wav"),
    ItemModel(Color(0xffFDEB57), "note3.wav"),
    ItemModel(Color(0xff33AF57), "note4.wav"),
    ItemModel(Color(0xff009587), "note5.wav"),
    ItemModel(Color(0xff0097ED), "note6.wav"),
    ItemModel(Color(0xff84248E), "note7.wav"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Tune",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff243139),
        elevation: 0,
      ),
      body: Column(
        children: columnBody(data),
      ),
    );
  }
}

List<Widget> columnBody(List<ItemModel> data) {
  List<TuneItem> body = [];
  for (int i = 0; i < data.length; i++) {
    body.add(TuneItem(
      element: data[i],
    ));
  }
  return body;
}
