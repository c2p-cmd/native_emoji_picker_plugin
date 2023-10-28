import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_emoji_picker_platform_interface.dart';

/// An implementation of [NativeEmojiPickerPlatform] that uses method channels.
class MethodChannelNativeEmojiPicker extends NativeEmojiPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_emoji_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Takes optional [initialEmoji] or defaults to "😎"
  /// [onNewEmoji] callback returns the result of the call
  @override
  void showEmojiPickerWith(
    String? initialEmoji,
    void Function(String) onNewEmoji,
  ) {
    methodChannel.invokeMethod<String>("show_emoji_picker_vc", initialEmoji);
    methodChannel.setMethodCallHandler((call) {
      if (call.method == "show_emoji_picker_vc") {
        onNewEmoji.call(call.arguments.toString());
      }

      return Future.value(-1);
    });
  }
}
