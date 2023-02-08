//
//  BackgroundDownloadRequestScenePresenterContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestScenePresentable {
	func response(responseType: BackgroundDownloadRequestScenePresenterResponse.BackgroundDownloadRequestSceneResponseType)
}

struct BackgroundDownloadRequestScenePresenterResponse {
	enum BackgroundDownloadRequestSceneResponseType {
		case initialSetup
		case releaseView
	}
}
