//
//  ImageDownloadTableViewCell.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

class InitialSceneTableViewCell: UITableViewCell {
    func setup(with model: InitialSceneTableViewCellViewModelType) {
        self.model = model
        
        title.text = model.title
        
        setupView()
    }
    
    private func setupView() {
        #warning("setting up view here")
    }
    
    private var model: InitialSceneTableViewCellViewModelType?
    
    @IBOutlet private weak var title: UILabel!
}

extension InitialSceneTableViewCell: NibLoadableView {}

extension InitialSceneTableViewCell {
    private struct Constansts {
        static let cornerRaiusValue: CGFloat = 10
        static let minScaleFactor: CGFloat = 0.5
    }
}
