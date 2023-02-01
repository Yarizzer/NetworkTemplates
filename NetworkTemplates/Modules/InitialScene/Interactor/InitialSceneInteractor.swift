//
//  InitialSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class InitialSceneInteractor {
	init(withRouter router: InitialSceneRoutable, presenter: InitialScenePresentable, service: InitialSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: InitialSceneRoutable
	private var presenter: InitialScenePresentable
	private var service: InitialSceneInteractorServiceType
}

extension InitialSceneInteractor: InitialSceneInteractable {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .routeToScene(let type):
            switch type {
            case .imageDownload: router.routeTo(scene: .imageDownload)
            case .basicGetRequest: router.routeTo(scene: .basicGetResponse)
            case .basicPostRequest: router.routeTo(scene: .basicPostREsponse)
            }
		}
	}
}
