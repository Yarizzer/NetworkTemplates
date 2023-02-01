//
//  BasicGetRequestScenePresenter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BasicGetRequestScenePresenter {
	init(for view: BasicGetRequestSceneViewControllerType, service: BasicGetRequestScenePresenterServiceType) {
		self.viewController = view
		self.service = service
        
        service.model.didReceivedNewData.subscribe(self) { [weak self] data in
            self?.viewController?.update(viewModelDataType: .reloadData)
        }
	}
	
	private var viewController: BasicGetRequestSceneViewControllerType?
	private var service: BasicGetRequestScenePresenterServiceType
}

extension BasicGetRequestScenePresenter: BasicGetRequestScenePresentable {
	func response(responseType: BasicGetRequestScenePresenterResponse.BasicGetRequestSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup:
            viewController?.update(viewModelDataType: .initialSetup(with: model))
            viewController?.update(viewModelDataType: .setupProvider(with: model))
		case .releaseView: viewController = nil
		}
	}
}
