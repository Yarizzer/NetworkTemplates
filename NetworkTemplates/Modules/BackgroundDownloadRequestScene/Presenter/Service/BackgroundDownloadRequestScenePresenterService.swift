//
//  BackgroundDownloadRequestScenePresenterService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestScenePresenterServiceType{
    var model: BackgroundDownloadRequestSceneViewModelType { get }
}

class BackgroundDownloadRequestScenePresenterService {
	init(withModel model: BackgroundDownloadRequestSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: BackgroundDownloadRequestSceneViewModelType
}

extension BackgroundDownloadRequestScenePresenterService: BackgroundDownloadRequestScenePresenterServiceType {
	var model: BackgroundDownloadRequestSceneViewModelType { return viewModel }
}
