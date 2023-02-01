//
//  BasicPostRequestSceneRouter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol BasicPostRequestSceneRoutable {
	static func assembly() -> UIViewController
    func dismiss()
}

class BasicPostRequestSceneRouter {
	private weak var view: BasicPostRequestSceneViewController?
}

extension BasicPostRequestSceneRouter: BasicPostRequestSceneRoutable {
	static func assembly() -> UIViewController {
		let router = BasicPostRequestSceneRouter()
		let vc                  = BasicPostRequestSceneViewController(nibName: String(describing: BasicPostRequestSceneViewController.self), bundle: Bundle.main)
		let viewModel           = BasicPostRequestSceneViewModel()
		let presenterService    = BasicPostRequestScenePresenterService(withModel: viewModel)
		let presenter           = BasicPostRequestScenePresenter(for: vc, service: presenterService)
		let interactorService   = BasicPostRequestSceneInteractorService(withModel: viewModel)
		let interactor          = BasicPostRequestSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: BasicPostRequestSceneViewController.self))")
		}
		
		return view
	}

    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
