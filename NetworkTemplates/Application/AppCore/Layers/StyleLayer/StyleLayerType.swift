//
//  StyleLayerType.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

protocol StyleLayerType {
    //Colors
    var colorClear: UIColor { get }
    var colorWhite: UIColor { get }
    var colorBlack: UIColor { get }
    var colorGray: UIColor { get }
    var colorRed: UIColor { get }
    var colorGreen: UIColor { get }
    var colorSoftYellow: UIColor { get }
    var colorBlue: UIColor { get }
    var colorPurple: UIColor { get }
    //Fonts
    var labelTitleFontLarge: UIFont { get }
    var labelTitleFontMedium: UIFont { get }
    var labelTitleFontSmall: UIFont { get }
    //Buttons
    var layerRegularBorderWidth: CGFloat { get }
    var layerRegularLineWidth: CGFloat { get }
}
