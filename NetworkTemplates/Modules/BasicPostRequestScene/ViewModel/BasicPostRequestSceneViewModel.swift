//
//  BasicPostRequestSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestSceneViewModelType {
    func setupSubscription()
    
    var didReceivedNewData: Publisher<Bool?> { get }
    
    var sceneTitle: String { get }
    var id: String { get }
    var userId: String { get }
    var title: String { get }
    var body: String { get }
    func sendRequest()
}

class BasicPostRequestSceneViewModel {
    func setupSubscription() {
        self.data = AppCore.shared.networkLayer.basicRequestValue.value?.last
        
        AppCore.shared.networkLayer.basicRequestValue.subscribe(self) { [weak self] data in
            self?.data = data.newValue?.last
        }
    }
    
    private var data: BasicRequestModel? {
        didSet {
            didReceivedNewData.value = true
        }
    }
    
    var didReceivedNewData: Publisher<Bool?> = Publisher(nil)
}

extension BasicPostRequestSceneViewModel: BasicPostRequestSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    var id: String { return "\(data?.id ?? Constants.intPalceholer)" }
    var userId: String { return "\(data?.userId ?? Constants.intPalceholer)"  }
    var title: String { return data?.title ?? Constants.stringPlaceholder }
    var body: String { return data?.body ?? Constants.stringPlaceholder }
    
    func sendRequest() {
        AppCore.shared.networkLayer.call(with: .basicPostRequest(withData: BasicRequestModel(id: Constants.dataToAdd.id, userId: Constants.dataToAdd.userId, title: Constants.dataToAdd.title, body: Constants.dataToAdd.body)))
    }
}

extension BasicPostRequestSceneViewModel {
    private struct Constants {
        static let sceneTitleValue = "Basic post response scene"
        static let intPalceholer = 0
        static let stringPlaceholder = "<undefined>"
        static let dataToAdd = (id: 101, userId: 101, title: "Test title", body: "Test body")
    }
}
