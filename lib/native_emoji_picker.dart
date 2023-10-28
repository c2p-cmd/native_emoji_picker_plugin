import 'native_emoji_picker_platform_interface.dart';

class NativeEmojiPicker {
  Future<String?> getPlatformVersion() {
    return NativeEmojiPickerPlatform.instance.getPlatformVersion();
  }

  static Future<String> showEmojiPicker(String? initialEmoji) {
    return NativeEmojiPickerPlatform.instance.showEmojiPicker(initialEmoji);
  }
}
