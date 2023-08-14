//
//  ImageLiterals.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/14.
//

import UIKit

enum ImageLiterals {
    
    // MARK: tabBarIcon
    
    static var home: UIImage { .load(name: "set")}
    static var homeFill: UIImage { .load(name: "setFill")}
    static var flag: UIImage { .load(name: "flag")}
    static var flagFill: UIImage { .load(name: "flagFill")}
    static var flex: UIImage { .load(name: "person")}
    static var flexFill: UIImage { .load(name: "personFill")}
    static var backButtonIcon: UIImage { .load(name: "backButtonIcon")}
    
    // MARK: Onboarding
    
    static var onboardingLogo: UIImage { .load(name: "OnboardingLogo")}
    
    // MARK: Flag
    
    static var colorIndicator: UIImage { .load(name: "colorIndicator")}
    static var flagIcon: UIImage { .load(name: "flagIcon")}
    static var check: UIImage { .load(name: "check")}
    static var checkFill: UIImage { .load(name: "checkFill")}

    //MARK: MyPage
    
    static var profileImage: UIImage { .load(name: "profileImage")}
    
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
