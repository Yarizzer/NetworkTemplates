//
//  ImageDownloadSceneInteractor.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class ImageDownloadSceneInteractor {
	init(withRouter router: ImageDownloadSceneRoutable, presenter: ImageDownloadScenePresentable, service: ImageDownloadSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: ImageDownloadSceneRoutable
	private var presenter: ImageDownloadScenePresentable
	private var service: ImageDownloadSceneInteractorServiceType
}

extension ImageDownloadSceneInteractor: ImageDownloadSceneInteractable {
	func makeRequest(requestType: ImageDownloadSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup:
            service.setupSubscription()
            presenter.response(responseType: .initialSetup)
        case .downloadImage: service.downloadImage()
        case .routeBack:
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
