//
//  BasicGetRequestSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestSceneViewModelType {
    func setupSubscription()
    
    var didReceivedNewData: Publisher<Bool?> { get }
    
    var sceneTitle: String { get }
    func sendRequest()
    func getCellViewModel(with index: Int) -> BasicRequestCellViewModelType?
}

class BasicGetRequestSceneViewModel {
    func setupSubscription() {
        AppCore.shared.networkLayer.basicRequestValue.subscribe(self) { [weak self] data in
            self?.responseData = data.newValue
        }
    }
    
    private var responseData: [BasicRequestModel]? {
        didSet {
            didReceivedNewData.value = true
        }
    }
    
    var didReceivedNewData: Publisher<Bool?> = Publisher(nil)
}

extension BasicGetRequestSceneViewModel: BasicGetRequestSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    
    func sendRequest() {
        AppCore.shared.networkLayer.call(with: .basicGetRequest)
    }
    
    func getCellViewModel(with index: Int) -> BasicRequestCellViewModelType? {
        guard let data = responseData?[index] else { return nil }
        
        return BasicRequestCellViewModel(with: data)
    }
}

extension BasicGetRequestSceneViewModel: TableViewProviderViewModelType {
    var numberOfSection: Int { return Constants.sectionsCount }
    
    func numberOfRowsIn(section: Int) -> Int {
        return responseData?.count ?? 0
    }
    
    func heightForRow(at index: Int) -> Float {
        return Constants.defaultCellHeight
    }
}

extension BasicGetRequestSceneViewModel {
    private struct Constants {
        static let sceneTitleValue = "Basic get response scene"
        static let sectionsCount = 1
        static let defaultCellHeight: Float = 80.0
    }
}
