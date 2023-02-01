//
//  ImageDownloadSceneRouter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol ImageDownloadSceneRoutable {
	static func assembly() -> UIViewController
    func dismiss()
}

class ImageDownloadSceneRouter {
	private weak var view: ImageDownloadSceneViewController?
}

extension ImageDownloadSceneRouter: ImageDownloadSceneRoutable {
	static func assembly() -> UIViewController {
		let router = ImageDownloadSceneRouter()
		let vc                  = ImageDownloadSceneViewController(nibName: String(describing: ImageDownloadSceneViewController.self), bundle: Bundle.main)
		let viewModel           = ImageDownloadSceneViewModel()
		let presenterService    = ImageDownloadScenePresenterService(withModel: viewModel)
		let presenter           = ImageDownloadScenePresenter(for: vc, service: presenterService)
		let interactorService   = ImageDownloadSceneInteractorService(withModel: viewModel)
		let interactor          = ImageDownloadSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: ImageDownloadSceneViewController.self))")
		}
		
		return view
	}
    
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
