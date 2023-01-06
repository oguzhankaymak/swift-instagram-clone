//
//  Font.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 6.01.2023.
//

import Foundation
import UIKit

enum AppFont {
    static let navigationTitle = Font.systemFont(size: FontSize.large, weight: FontWeight.bold)
    static let postTitle = Font.systemFont(size: FontSize.normal, weight: FontWeight.bold)
    static let postText = Font.systemFont(size: FontSize.normal, weight: FontWeight.regular)
    static let postSmallBoldText = Font.systemFont(size: FontSize.small, weight: FontWeight.bold)
    static let postSmallText = Font.systemFont(size: FontSize.small, weight: FontWeight.regular)
}

private enum Font {
    static func systemFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }

    static func systemItalicFont(size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
    }
}

private enum FontSize {
    static let large: CGFloat = 26
    static let normal: CGFloat = 15
    static let small: CGFloat = 13
}

private enum FontWeight {
    static let bold = UIFont.Weight.bold
    static let regular = UIFont.Weight.regular
    static let light = UIFont.Weight.light
}
