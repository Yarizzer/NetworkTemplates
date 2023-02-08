//
//  UploadImageSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class UploadImageSceneInteractor {
	init(withRouter router: UploadImageSceneRoutable, presenter: UploadImageScenePresentable, service: UploadImageSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: UploadImageSceneRoutable
	private var presenter: UploadImageScenePresentable
	private var service: UploadImageSceneInteractorServiceType
}

extension UploadImageSceneInteractor: UploadImageSceneInteractable {
	func makeRequest(requestType: UploadImageSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
		}
	}
}
