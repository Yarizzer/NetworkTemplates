//
//  BasicPostRequestScenePresenter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class BasicPostRequestScenePresenter {
	init(for view: BasicPostRequestSceneViewControllerType, service: BasicPostRequestScenePresenterServiceType) {
		self.viewController = view
		self.service = service
        
        service.model.didReceivedNewData.subscribe(self) { [weak self] data in
            self?.viewController?.update(viewModelDataType: .updateData(with: service.model))
        }
	}
	
	private var viewController: BasicPostRequestSceneViewControllerType?
	private var service: BasicPostRequestScenePresenterServiceType
}

extension BasicPostRequestScenePresenter: BasicPostRequestScenePresentable {
	func response(responseType: BasicPostRequestScenePresenterResponse.BasicPostRequestSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: viewController = nil
		}
	}
}
