import "package:emoji/core/emoji/emoji_selector.dart";
import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Эмоджики)))))))',
      home: EmojiSelector(),
    );
  }
}