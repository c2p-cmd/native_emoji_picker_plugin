import Flutter
import UIKit

public class NativeEmojiPickerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "native_emoji_picker", binaryMessenger: registrar.messenger())
        let instance = NativeEmojiPickerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
            break
        case "show_emoji_picker_vc":
            let initialEmoji = call.arguments as? String
            showPicker(initialEmoji, flutterResult: result)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func showPicker(_ initialEmoji: String?, flutterResult: @escaping FlutterResult) {
        guard let rootVC = UIApplication.shared.firstKeyWindow?.rootViewController else {
            flutterResult(FlutterError(code: "VIEWCONTROLLER_NOT_FOUND", message: "NO ROOT VIEW CONTROLLER", details: nil))
            return
        }
        
        let emojiPickerVC = EmojiPickerController()
        emojiPickerVC.result = flutterResult
        emojiPickerVC.initialEmoji = initialEmoji
        rootVC.present(emojiPickerVC, animated: true)
    }
}
