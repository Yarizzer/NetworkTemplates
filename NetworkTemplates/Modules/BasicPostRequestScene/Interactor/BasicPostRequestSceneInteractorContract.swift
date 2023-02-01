//
//  BasicPostRequestSceneInteractorContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestSceneInteractable {
	func makeRequest(requestType: BasicPostRequestSceneInteractorRequest.RequestType)
}

struct BasicPostRequestSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case sendRequest
        case routeBack
	}
}
