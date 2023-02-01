//
//  BasicPostRequestScenePresenterContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestScenePresentable {
	func response(responseType: BasicPostRequestScenePresenterResponse.BasicPostRequestSceneResponseType)
}

struct BasicPostRequestScenePresenterResponse {
	enum BasicPostRequestSceneResponseType {
		case initialSetup
		case releaseView
	}
}
