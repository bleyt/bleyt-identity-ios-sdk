//
//  UIFont.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation
import UIKit


extension UIFont {
    
    static func custom(fontType: UIFontType, size: CGFloat) -> UIFont? {
        let font = UIFont(name: fontType.rawValue, size: size)
        return font!
    }
    
    static func bolder(size: CGFloat = 14) -> UIFont {
        let font = UIFont.custom(fontType: UIFontType.DefaultBold, size: size)
        return font!
    }
    
    static func bold(size: CGFloat = 14) -> UIFont {
        let font = UIFont.custom(fontType: UIFontType.DefaultBold, size: size)
        return font!
    }
    
    static func regular(size: CGFloat = 14) -> UIFont {
        let font = UIFont.custom(fontType: UIFontType.DefaultRegular, size: size)
        return font!
    }
    
    static func medium(size: CGFloat = 14) -> UIFont {
        let font = UIFont.custom(fontType: UIFontType.DefaultMedium, size: size)
        return font!
    }
    
}
