//
//  UIFont.swift
//  MVP
//
//  Created by Romanovich Bogdan on 30.07.2021.
//


import UIKit

extension UIFont {

    public enum AvenirNextSansType: String {
        case bold = " Bold"
        case boldItalic = " Bold Italic"
        case demiBold = " Demi Bold"
        case demiBoldItalic = " Demi Bold Italic"
        case italic = " Italic"
        case medium = " Medium"
        case mediumItalic = " Medium Italic"
        case regular = ""
        case ultraLight = " Ultra Light"
        case ultraLightItalic = " Ultra Light Italic"
    }

    static func AvenirNext(_ type: AvenirNextSansType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Avenir Next\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
