import Flutter
import UIKit

public class NativeEmojiPickerPlugin: NSObject, FlutterPlugin {
    static var channel: FlutterMethodChannel?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "native_emoji_picker", binaryMessenger: registrar.messenger())
        let instance = NativeEmojiPickerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel!)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
            break
        case "show_emoji_picker_vc":
            let initialEmoji = call.arguments as? String
            showPicker(initialEmoji, on: Self.channel)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func showPicker(_ initialEmoji: String?, on channel: FlutterMethodChannel?) {
        guard let rootVC = UIApplication.shared.firstKeyWindow?.rootViewController else {
            channel?.invokeMethod("show_emoji_picker_vc", arguments: FlutterError(code: "VIEWCONTROLLER_NOT_FOUND", message: "NO ROOT VIEW CONTROLLER", details: nil))
            return
        }
        
        let emojiPickerVC = EmojiPickerController()
        emojiPickerVC.initialEmoji = initialEmoji
        emojiPickerVC.channel = Self.channel
        rootVC.present(emojiPickerVC, animated: true)
    }
}
