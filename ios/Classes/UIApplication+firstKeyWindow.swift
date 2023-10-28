//
//  UIApplication+firstKeyWindow.swift
//  native_emoji_picker
//
//  Created by Sharan Thakur on 28/10/23.
//

import Foundation

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .filter { $0.activationState == .foregroundActive }
                .first?.windows
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
