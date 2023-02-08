//
//  UploadImageScenePresenterContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol UploadImageScenePresentable {
	func response(responseType: UploadImageScenePresenterResponse.UploadImageSceneResponseType)
}

struct UploadImageScenePresenterResponse {
	enum UploadImageSceneResponseType {
		case initialSetup
		case releaseView
	}
}
