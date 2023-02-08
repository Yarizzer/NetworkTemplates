//
//  UploadImageSceneRouter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol UploadImageSceneRoutable {
	static func assembly() -> UIViewController
	func dismiss()
}

class UploadImageSceneRouter {
	private weak var view: UploadImageSceneViewController?
}

extension UploadImageSceneRouter: UploadImageSceneRoutable {
	static func assembly() -> UIViewController {
		let router = UploadImageSceneRouter()
		let vc                  = UploadImageSceneViewController(nibName: String(describing: UploadImageSceneViewController.self), bundle: Bundle.main)
		let viewModel           = UploadImageSceneViewModel()
		let presenterService    = UploadImageScenePresenterService(withModel: viewModel)
		let presenter           = UploadImageScenePresenter(for: vc, service: presenterService)
		let interactorService   = UploadImageSceneInteractorService(withModel: viewModel)
		let interactor          = UploadImageSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: UploadImageSceneViewController.self))")
		}
		
		return view
	}
    
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
