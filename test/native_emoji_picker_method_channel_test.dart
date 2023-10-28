import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_emoji_picker/native_emoji_picker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeEmojiPicker platform = MethodChannelNativeEmojiPicker();
  const MethodChannel channel = MethodChannel('native_emoji_picker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
