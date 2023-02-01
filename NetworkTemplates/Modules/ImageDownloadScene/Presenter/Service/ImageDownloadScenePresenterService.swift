//
//  ImageDownloadScenePresenterService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol ImageDownloadScenePresenterServiceType{
	var model: ImageDownloadSceneViewModelType { get }
}

class ImageDownloadScenePresenterService {
	init(withModel model: ImageDownloadSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: ImageDownloadSceneViewModelType
}

extension ImageDownloadScenePresenterService: ImageDownloadScenePresenterServiceType {
	var model: ImageDownloadSceneViewModelType { return viewModel }
}
