//
//  ImageDownloadSceneInteractorContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol ImageDownloadSceneInteractable {
	func makeRequest(requestType: ImageDownloadSceneInteractorRequest.RequestType)
}

struct ImageDownloadSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case downloadImage
        case routeBack
	}
}
