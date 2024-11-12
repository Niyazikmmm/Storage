import "package:shared_preferences/shared_preferences.dart";

class EmojiStorage {
  static const String _activeEmojiIndex = 'active_emoji_index';

  static Future<void> saveActiveEmojiIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_activeEmojiIndex, index);
  }
  static Future<int?> getActiveEmojiIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_activeEmojiIndex);
  }
}