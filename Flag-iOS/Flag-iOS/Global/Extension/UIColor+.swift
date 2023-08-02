//
//  UIColor+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

extension UIColor {
    static var purpleBackground: UIColor {
        return UIColor(hex: "#F5F2FF")
    }
    static var purpleDefault: UIColor {
        return UIColor(hex: "#8E6FFF")
    }
    static var purpleDark: UIColor {
        return UIColor(hex: "#6041FF")
    }
    static var grayDefault: UIColor {
        return UIColor(hex: "FAFAFA")
    }
    static var grayDark1: UIColor {
        return UIColor(hex: "#D9D9D9")
    }
    static var grayDark2: UIColor {
        return UIColor(hex: "#B0B0B0")
    }
    static var grayDark3: UIColor {
        return UIColor(hex: "#7A7A7A")
    }
    static var purple1: UIColor {
        return UIColor(hex: "#DDD4FF")
    }
    static var purple2: UIColor {
        return UIColor(hex: "#BDABFF")
    }
    static var purple3: UIColor {
        return UIColor(hex: "#997DFF")
    }
    static var purple4: UIColor {
        return UIColor(hex: "#7955FE")
    }
    static var purple5: UIColor {
        return UIColor(hex: "#6439FF")
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
