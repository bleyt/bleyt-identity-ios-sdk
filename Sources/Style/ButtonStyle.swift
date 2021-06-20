//
//  ButtonStyle.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation
import UIKit

struct ButtonStyle {
    var backgroundColor: UIColor
    var pressedBackgroundColor: UIColor
    var textColor: UIColor
    var font : UIFont
    var borderWidth : CGFloat? = nil
    var borderColor: CGColor? = nil
    var height: CGFloat = 50
    var cornerRadius : CGFloat = 5
}

enum ButtonViewStyle {
    
    case Default, DefaultOutline, DefaultIcon
    
    func create() -> ButtonStyle {
        switch self {
        case .Default, .DefaultIcon: return ButtonStyle(backgroundColor: UIColor.primaryDark, pressedBackgroundColor: UIColor(netHex: 0x133836), textColor: .white, font: UIFont.medium(size: 15))
        case .DefaultOutline:
            return ButtonStyle(backgroundColor: .white, pressedBackgroundColor: UIColor(netHex: 0xFBFBFB), textColor: UIColor.primaryDark, font: UIFont.medium(size: 15), borderWidth: 1 , borderColor: UIColor(netHex: 0xF0F0F0).cgColor, height: 50)
        }
    }
    
}
