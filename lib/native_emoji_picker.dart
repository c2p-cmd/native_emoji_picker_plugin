import 'native_emoji_picker_platform_interface.dart';

class NativeEmojiPicker {
  Future<String?> getPlatformVersion() {
    return NativeEmojiPickerPlatform.instance.getPlatformVersion();
  }

  /// Takes optional [initialEmoji] or defaults to "😎"
  /// [onNewEmoji] callback returns the result of the call
  static void showEmojiPickerWith({
    String? initialEmoji,
    required void Function(String) onNewEmoji,
  }) {
    NativeEmojiPickerPlatform.instance.showEmojiPickerWith(
      initialEmoji,
      onNewEmoji,
    );
  }
}
