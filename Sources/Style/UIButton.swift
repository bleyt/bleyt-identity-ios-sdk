//
//  UIButton.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation
import UIKit


extension UIButton {
    
    static func create(title: String, style: ButtonViewStyle, icon: String? = nil) -> UIButton {
        let button = UIButton()
        button.apply(style: style.create())
        button.setTitle(title, for: .normal)
        return button
    }
    
    func apply(style: ButtonStyle) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        setTitleColor(style.textColor, for: .normal)
        setTitleColor(UIColor(netHex: 0xA6A6A6), for: .disabled)
        layer.cornerRadius = style.cornerRadius
        titleLabel?.font = style.font
        layer.masksToBounds = true
        backgroundColor = style.backgroundColor
        
        if let boderColor = style.borderColor {
            self.layer.borderColor = boderColor
        }
        if let borderWidth = style.borderWidth {
            self.layer.borderWidth = borderWidth
        }
    }
}


