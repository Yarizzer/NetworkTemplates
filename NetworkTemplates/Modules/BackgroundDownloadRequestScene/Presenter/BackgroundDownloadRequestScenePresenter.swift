//
//  BackgroundDownloadRequestScenePresenter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BackgroundDownloadRequestScenePresenter {
	init(for view: BackgroundDownloadRequestSceneViewControllerType, service: BackgroundDownloadRequestScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: BackgroundDownloadRequestSceneViewControllerType?
	private var service: BackgroundDownloadRequestScenePresenterServiceType
}

extension BackgroundDownloadRequestScenePresenter: BackgroundDownloadRequestScenePresentable {
	func response(responseType: BackgroundDownloadRequestScenePresenterResponse.BackgroundDownloadRequestSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: viewController = nil
		}
	}
}
