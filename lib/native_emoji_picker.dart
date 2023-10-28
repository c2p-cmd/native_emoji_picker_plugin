
import 'native_emoji_picker_platform_interface.dart';

class NativeEmojiPicker {
  Future<String?> getPlatformVersion() {
    return NativeEmojiPickerPlatform.instance.getPlatformVersion();
  }
}
