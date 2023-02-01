//
//  BasicPostRequestSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BasicPostRequestSceneInteractor {
	init(withRouter router: BasicPostRequestSceneRoutable, presenter: BasicPostRequestScenePresentable, service: BasicPostRequestSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: BasicPostRequestSceneRoutable
	private var presenter: BasicPostRequestScenePresentable
	private var service: BasicPostRequestSceneInteractorServiceType
}

extension BasicPostRequestSceneInteractor: BasicPostRequestSceneInteractable {
	func makeRequest(requestType: BasicPostRequestSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup:
            presenter.response(responseType: .initialSetup)
            service.setupSubscription()
        case .sendRequest: service.sendRequest()
        case .routeBack:
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
