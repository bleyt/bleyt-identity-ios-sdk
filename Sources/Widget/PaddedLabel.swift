//
//  PaddedLabel.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation
import UIKit


@IBDesignable class PaddedLabel: UILabel {
    
    var marginInset : CGFloat = 7 {
        didSet {
            self.topInset = marginInset
            self.bottomInset = marginInset
            self.leftInset = marginInset
            self.rightInset = marginInset
            
            self.layoutIfNeeded()
        }
    }
    
    var addedHeight: CGFloat = 0
    var addedWidth: CGFloat = 0
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0{
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize : CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset + addedHeight
        intrinsicSuperViewContentSize.width += leftInset + rightInset + addedWidth
        return intrinsicSuperViewContentSize
    }
}

