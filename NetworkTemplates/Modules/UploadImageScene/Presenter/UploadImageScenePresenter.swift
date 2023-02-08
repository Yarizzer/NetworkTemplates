//
//  UploadImageScenePresenter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class UploadImageScenePresenter {
	init(for view: UploadImageSceneViewControllerType, service: UploadImageScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: UploadImageSceneViewControllerType?
	private var service: UploadImageScenePresenterServiceType
}

extension UploadImageScenePresenter: UploadImageScenePresentable {
	func response(responseType: UploadImageScenePresenterResponse.UploadImageSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: viewController = nil
		}
	}
}
