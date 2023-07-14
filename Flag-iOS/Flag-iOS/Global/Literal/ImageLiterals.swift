//
//  ImageLiterals.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/14.
//

import UIKit

enum ImageLiterals {
    
    // MARK:
    
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
