//
//  StyleLayer.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

class StyleLayer {
    //MARK: - Style
    private enum StyleColors {
        case clear
        case white
        case black
        case gray
        case red
        case green
        case softYellow
        case blue
        case purple
        
        var color: UIColor {
            switch self {
            case .clear:        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            case .white:        return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            case .black:        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .gray:         return #colorLiteral(red: 0.5450980392, green: 0.5450980392, blue: 0.5450980392, alpha: 1)        // hex: 8B8B8B
            case .red:          return #colorLiteral(red: 1, green: 0.3137254902, blue: 0, alpha: 1)        // hex: FF5000
            case .green:        return #colorLiteral(red: 0, green: 0.6666666667, blue: 0.3137254902, alpha: 1)        // hex: 00AA50
            case .softYellow:   return #colorLiteral(red: 0.9607843137, green: 0.9411764706, blue: 0.6, alpha: 1)        // hex: F5F099
            case .blue:         return #colorLiteral(red: 0.05490196078, green: 0.4823529412, blue: 0.9843137255, alpha: 1)        // hex: 0E7BFB
            case .purple:       return #colorLiteral(red: 0.5450980392, green: 0, blue: 1, alpha: 1)        // hex: 8B00FF
            }
        }
    }
}

extension StyleLayer: StyleLayerType {
    //Colors
    var colorClear: UIColor { return StyleColors.clear.color }
    var colorWhite: UIColor { return StyleColors.white.color }
    var colorBlack: UIColor { return StyleColors.black.color }
    var colorGray: UIColor { return StyleColors.gray.color }
    var colorRed: UIColor { return StyleColors.red.color }
    var colorGreen: UIColor { return StyleColors.green.color }
    var colorSoftYellow: UIColor { return StyleColors.softYellow.color }
    var colorBlue: UIColor { return StyleColors.blue.color }
    var colorPurple: UIColor { return StyleColors.purple.color }
    //Fonts
    var labelTitleFontLarge: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.largeFontValue)! }
    var labelTitleFontMedium: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.mediumFontValue)! }
    var labelTitleFontSmall: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.smallFontValue)! }
    //Layers
    var layerRegularBorderWidth: CGFloat { return Constants.regularBorderWidthValue}
    var layerRegularLineWidth: CGFloat { return Constants.regularLineWidthValue }
}

extension StyleLayer {
    private struct Constants {
        static let mainAppFontName = "AppleSDGothicNeo-UltraLight"
        static let largeFontValue: CGFloat = 20
        static let mediumFontValue: CGFloat = 17
        static let smallFontValue: CGFloat = 14
        static let regularBorderWidthValue: CGFloat = 1.0
        static let regularLineWidthValue: CGFloat = 2.0
    }
}
