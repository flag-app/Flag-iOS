//
//  ImageLiterals.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/14.
//

import UIKit

enum ImageLiterals {
    
    // MARK: tabBarIcon
    
    static var home: UIImage { .load(name: "home")}
    static var homeFill: UIImage { .load(name: "homeFill")}
    static var flag: UIImage { .load(name: "flag")}
    static var flagFill: UIImage { .load(name: "flagFill")}
    static var flex: UIImage { .load(name: "flex")}
    static var flexFill: UIImage { .load(name: "flexFill")}
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
