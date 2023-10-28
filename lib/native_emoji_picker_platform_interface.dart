import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_emoji_picker_method_channel.dart';

abstract class NativeEmojiPickerPlatform extends PlatformInterface {
  /// Constructs a NativeEmojiPickerPlatform.
  NativeEmojiPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeEmojiPickerPlatform _instance = MethodChannelNativeEmojiPicker();

  /// The default instance of [NativeEmojiPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeEmojiPicker].
  static NativeEmojiPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeEmojiPickerPlatform] when
  /// they register themselves.
  static set instance(NativeEmojiPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void showEmojiPickerWith(String? initialEmoji, void Function(String) callback) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
