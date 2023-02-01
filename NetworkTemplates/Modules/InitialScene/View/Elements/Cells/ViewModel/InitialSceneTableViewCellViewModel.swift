//
//  ImageDownloadCellViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

protocol InitialSceneTableViewCellViewModelType {
    var title: String { get }
}

class InitialSceneTableViewCellViewModel {
    init(with type: InitialSceneCellType) {
        self.type = type
    }
    
    private var type: InitialSceneCellType
}

extension InitialSceneTableViewCellViewModel: InitialSceneTableViewCellViewModelType {
    var title: String {
        switch type {
        case .imageDownload: return Constants.imageDownloadTypeValue
        case .basicGetRequest: return Constants.basicGetRequestTypeValue
        case .basicPostRequest: return Constants.basicPostRequestTypeValue
        }
    }
}

extension InitialSceneTableViewCellViewModel {
    private struct Constants {
        static let imageDownloadTypeValue = "Image download type"
        static let basicGetRequestTypeValue = "Basic get request type"
        static let basicPostRequestTypeValue = "Basic post request type"
    }
}
