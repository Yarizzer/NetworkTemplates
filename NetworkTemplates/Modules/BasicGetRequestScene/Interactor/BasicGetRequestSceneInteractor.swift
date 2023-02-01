//
//  BasicGetRequestSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BasicGetRequestSceneInteractor {
	init(withRouter router: BasicGetRequestSceneRoutable, presenter: BasicGetRequestScenePresentable, service: BasicGetRequestSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: BasicGetRequestSceneRoutable
	private var presenter: BasicGetRequestScenePresentable
	private var service: BasicGetRequestSceneInteractorServiceType
}

extension BasicGetRequestSceneInteractor: BasicGetRequestSceneInteractable {
	func makeRequest(requestType: BasicGetRequestSceneInteractorRequest.RequestType) {
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
