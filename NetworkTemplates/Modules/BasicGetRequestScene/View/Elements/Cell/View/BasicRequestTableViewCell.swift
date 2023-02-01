//
//  BasicRequestTableViewCell.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//

import UIKit

class BasicRequestTableViewCell: UITableViewCell {
    func setup(with model: BasicRequestCellViewModelType) {
        self.model = model
        
        self.id.text = model.id.description
        self.userId.text = model.userId.description
        self.title.text = model.title
        self.content.text = model.body
    }
    
    private var model: BasicRequestCellViewModelType?
    
    @IBOutlet private weak var id: UILabel!
    @IBOutlet private weak var userId: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var content: UILabel!
}

extension BasicRequestTableViewCell: NibLoadableView {}


