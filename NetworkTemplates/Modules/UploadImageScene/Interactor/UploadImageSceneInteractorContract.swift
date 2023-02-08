//
//  UploadImageSceneInteractorContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol UploadImageSceneInteractable {
	func makeRequest(requestType: UploadImageSceneInteractorRequest.RequestType)
}

struct UploadImageSceneInteractorRequest {
	enum RequestType {
		case initialSetup
	}
}
