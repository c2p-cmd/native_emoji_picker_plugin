#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_emoji_picker.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_emoji_picker'
  s.version          = '0.0.1'
  s.summary          = 'An iOS Flutter plugin to show macOS like emoji picker!.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://https://github.com/c2p-cmd/native_emoji_picker_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Sharan Thakur' => 'sharandt19@live.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'MCEmojiPicker'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
