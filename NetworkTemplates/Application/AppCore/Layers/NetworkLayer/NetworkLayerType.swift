//
//  NetworkLayerType.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import Foundation

enum NetworkLayerActionType {
    case fetchImage
    case basicGetRequest
    case basicPostRequest(withData: BasicRequestModel)
    case backgroundRequest
}

protocol NetworkLayerType {
    func prepareSession()
    func runSubscription()
    //Publishers
    var imageData: Publisher<Data?> { get }
    var basicRequestValue: Publisher<[BasicRequestModel]?> { get }
    var bgDownloadProgress: Publisher<Float?> { get }
    
    func call(with action: NetworkLayerActionType)
}
