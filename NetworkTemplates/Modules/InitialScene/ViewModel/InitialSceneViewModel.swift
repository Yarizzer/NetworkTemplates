//
//  InitialSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneViewModelType {
    var sceneTitle: String { get }
    func getCellViewModel(with index: Int) -> InitialSceneTableViewCellViewModelType
    func getCellType(for index: Int) -> InitialSceneCellType
}

class InitialSceneViewModel {
    init() {
        self.types.append(.imageDownload)
        self.types.append(.basicGetRequest)
        self.types.append(.basicPostRequest)
    }
    
    private var types = [InitialSceneCellType]()
}

extension InitialSceneViewModel: InitialSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    func getCellViewModel(with index: Int) -> InitialSceneTableViewCellViewModelType {
        return InitialSceneTableViewCellViewModel(with: types[index])
    }
    func getCellType(for index: Int) -> InitialSceneCellType {
        return types[index]
    }
}

extension InitialSceneViewModel: TableViewProviderViewModelType {
    var numberOfSection: Int { return Constants.sectionsCount }
    
    func numberOfRowsIn(section: Int) -> Int {
        return types.count
    }
    
    func heightForRow(at index: Int) -> Float {
        return Constants.defaultCellHeight
    }
}

extension InitialSceneViewModel {
    private struct Constants {
        static let sceneTitleValue = "Initial scene"
        static let sectionsCount = 1
        static let defaultCellHeight: Float = 80.0
    }
}
