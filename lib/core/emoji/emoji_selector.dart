import 'package:emoji/core/storage_service/storage_service.dart';
import 'package:flutter/material.dart';

class EmojiSelector extends StatefulWidget {
  const EmojiSelector({super.key});

  @override
  _EmojiSelectorState createState() =>  _EmojiSelectorState();
}

class  _EmojiSelectorState extends State <EmojiSelector> {
  final List<String> emojis = ["😂", "😁", "🌚", "👍", "🤔", "😍", "🙈"];
  int activeEmojiIndex = 0;
  @override
  void initState() {
    super.initState();
    _loadActiveEmoji(); 
  }

  _loadActiveEmoji() async {
    int? index = await EmojiStorage.getActiveEmojiIndex();
    if (index != null) {
      setState(() {
        activeEmojiIndex = index;
      });
    }
  }

  _saveActiveEmoji() async {
    await EmojiStorage.saveActiveEmojiIndex(activeEmojiIndex);
  }

  void _nextEmoji() {
    setState(() {
        activeEmojiIndex = (activeEmojiIndex + 1) % emojis.length;
        _saveActiveEmoji();
    });
  }

  void _PREVEmoji() {
    setState(() {
        activeEmojiIndex = (activeEmojiIndex - 1) % emojis.length;
        _saveActiveEmoji();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Text(
          emojis[activeEmojiIndex]
        )
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: _PREVEmoji,
          ),
          FloatingActionButton(
            onPressed: _nextEmoji,
          )
        ],
      ),

    );
  }
}  
  