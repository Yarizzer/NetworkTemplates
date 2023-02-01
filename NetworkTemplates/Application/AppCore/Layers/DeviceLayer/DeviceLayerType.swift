//
//  DeviceLayerType.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

protocol DeviceLayerType {
    var screenSize: CGRect { get }
    var hasTopNotch: Bool { get }
    
    func generateSuccessFeedback()
    func generateFailureFeedback()
    func vibrate()
}
