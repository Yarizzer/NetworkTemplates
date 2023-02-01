//
//  ImageDownloadScenePresenter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class ImageDownloadScenePresenter {
	init(for view: ImageDownloadSceneViewControllerType, service: ImageDownloadScenePresenterServiceType) {
		self.viewController = view
		self.service = service
        
        service.model.didFetchedData.subscribe(self) { [weak self] data in
            self?.viewController?.update(viewModelDataType: .updateImage(with: service.model))
        }
	}
	
	private var viewController: ImageDownloadSceneViewControllerType?
	private var service: ImageDownloadScenePresenterServiceType
}

extension ImageDownloadScenePresenter: ImageDownloadScenePresentable {
	func response(responseType: ImageDownloadScenePresenterResponse.ImageDownloadSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: viewController = nil
		}
	}
}
