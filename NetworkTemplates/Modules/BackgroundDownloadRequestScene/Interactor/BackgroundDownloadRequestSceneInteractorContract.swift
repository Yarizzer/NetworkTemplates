//
//  BackgroundDownloadRequestSceneInteractorContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestSceneInteractable {
	func makeRequest(requestType: BackgroundDownloadRequestSceneInteractorRequest.RequestType)
}

struct BackgroundDownloadRequestSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case sendDownloadRequest
        case routeBack
	}
}
