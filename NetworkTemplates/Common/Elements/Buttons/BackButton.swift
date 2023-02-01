//
//  BackButton.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = frame.height / 2
        
        configureSign()
    }
    
    private func setupView() {
        signShapeLayer = CAShapeLayer()
        
        backgroundColor = AppCore.shared.styleLayer.colorGray

        layer.addSublayer(signShapeLayer)
    }
    
    private func configureSign() {
        signShapeLayer.frame = bounds
        
        let signPath = UIBezierPath()
        
        let firstPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height / 4)
        let secondPoint = CGPoint(x: self.frame.width / 3, y: self.frame.height / 2)
        let thirdPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height - (self.frame.height / 4))
        
        signPath.move(to: firstPoint)
        signPath.addLine(to: secondPoint)
        signPath.addLine(to: thirdPoint)
        
        signShapeLayer.path = signPath.cgPath
    }
    
    func appear() {
        self.signShapeLayer.strokeEnd = Constants.signDefaultStrokeEnd
    }
    
    private var signShapeLayer: CAShapeLayer! {
        didSet {
            signShapeLayer.fillColor = AppCore.shared.styleLayer.colorClear.cgColor
            signShapeLayer.strokeColor = AppCore.shared.styleLayer.colorWhite.cgColor
            signShapeLayer.strokeEnd = Constants.signInitialStrokeEnd
            signShapeLayer.lineWidth = AppCore.shared.styleLayer.layerRegularLineWidth
            signShapeLayer.lineCap = .round
        }
    }
}

extension BackButton {
    private struct Constants {
        static let signInitialStrokeEnd: CGFloat = 0
        static let signDefaultStrokeEnd: CGFloat = 1
    }
}
