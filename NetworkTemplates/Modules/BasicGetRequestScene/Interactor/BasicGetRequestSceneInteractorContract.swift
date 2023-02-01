//
//  BasicGetRequestSceneInteractorContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestSceneInteractable {
	func makeRequest(requestType: BasicGetRequestSceneInteractorRequest.RequestType)
}

struct BasicGetRequestSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case sendRequest
        case routeBack
	}
}
