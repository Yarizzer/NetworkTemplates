//
//  BasicGetRequestScenePresenterContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestScenePresentable {
	func response(responseType: BasicGetRequestScenePresenterResponse.BasicGetRequestSceneResponseType)
}

struct BasicGetRequestScenePresenterResponse {
	enum BasicGetRequestSceneResponseType {
		case initialSetup
		case releaseView
	}
}
