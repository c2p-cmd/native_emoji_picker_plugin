import 'package:flutter_test/flutter_test.dart';
import 'package:native_emoji_picker/native_emoji_picker.dart';
import 'package:native_emoji_picker/native_emoji_picker_platform_interface.dart';
import 'package:native_emoji_picker/native_emoji_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeEmojiPickerPlatform
    with MockPlatformInterfaceMixin
    implements NativeEmojiPickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeEmojiPickerPlatform initialPlatform = NativeEmojiPickerPlatform.instance;

  test('$MethodChannelNativeEmojiPicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeEmojiPicker>());
  });

  test('getPlatformVersion', () async {
    NativeEmojiPicker nativeEmojiPickerPlugin = NativeEmojiPicker();
    MockNativeEmojiPickerPlatform fakePlatform = MockNativeEmojiPickerPlatform();
    NativeEmojiPickerPlatform.instance = fakePlatform;

    expect(await nativeEmojiPickerPlugin.getPlatformVersion(), '42');
  });
}
