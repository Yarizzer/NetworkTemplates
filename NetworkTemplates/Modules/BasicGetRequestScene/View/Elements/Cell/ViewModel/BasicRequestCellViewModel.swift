//
//  BasicRequestCellViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//

protocol BasicRequestCellViewModelType {
    var id: Int { get }
    var userId: Int { get }
    var title: String { get }
    var body: String { get }
}

class BasicRequestCellViewModel {
    init(with data: BasicRequestModel) {
        self.data = data
    }
    
    private var data: BasicRequestModel
}

extension BasicRequestCellViewModel: BasicRequestCellViewModelType {
    var id: Int { data.id }
    var userId: Int { data.userId }
    var title: String { data.title }
    var body: String { data.body }
}
