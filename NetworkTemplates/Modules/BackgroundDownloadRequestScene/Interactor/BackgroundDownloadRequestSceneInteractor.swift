//
//  BackgroundDownloadRequestSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BackgroundDownloadRequestSceneInteractor {
	init(withRouter router: BackgroundDownloadRequestSceneRoutable, presenter: BackgroundDownloadRequestScenePresentable, service: BackgroundDownloadRequestSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: BackgroundDownloadRequestSceneRoutable
	private var presenter: BackgroundDownloadRequestScenePresentable
	private var service: BackgroundDownloadRequestSceneInteractorServiceType
}

extension BackgroundDownloadRequestSceneInteractor: BackgroundDownloadRequestSceneInteractable {
	func makeRequest(requestType: BackgroundDownloadRequestSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup:
            service.setupSubscription()
            presenter.response(responseType: .initialSetup)
        case .sendDownloadRequest: service.sendRequest()
        case .routeBack:
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
