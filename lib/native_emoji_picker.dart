import 'native_emoji_picker_platform_interface.dart';

class NativeEmojiPicker {
  Future<String?> getPlatformVersion() {
    return NativeEmojiPickerPlatform.instance.getPlatformVersion();
  }

  // This function will call the iOS emoji picker and will result in
  // new emoji
  // paramters: initial emoji which is optional
  // and defaults to "😎"
  static Future<String> showEmojiPicker(String? initialEmoji) {
    return NativeEmojiPickerPlatform.instance.showEmojiPicker(initialEmoji);
  }
}
