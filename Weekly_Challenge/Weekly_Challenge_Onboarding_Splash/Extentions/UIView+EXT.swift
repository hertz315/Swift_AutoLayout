//
//  UIView+EXT.swift
//  Weekly_Challenge_Onboarding_Splash
//
//  Created by Hertz on 9/14/22.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
