//
//  UIFont+Ext.swift
//  CustomButton
//
//  Created by Hertz on 10/9/22.
//

import Foundation
import UIKit

extension UIFont {

    public enum SunflowerType: String {
        case medium = "-Medium"
        case light = "-Light"
        case bold = "-Bold"
    }

    static func Font(_ type: SunflowerType = .medium, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Sunflower\(type.rawValue)", size: size)!
    }

}
