//
//  ImageDownloadScenePresenterContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol ImageDownloadScenePresentable {
	func response(responseType: ImageDownloadScenePresenterResponse.ImageDownloadSceneResponseType)
}

struct ImageDownloadScenePresenterResponse {
	enum ImageDownloadSceneResponseType {
		case initialSetup
		case releaseView
	}
}
