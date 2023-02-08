//
//  BackgroundDownloadRequestSceneRouter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol BackgroundDownloadRequestSceneRoutable {
	static func assembly() -> UIViewController
	func dismiss()
}

class BackgroundDownloadRequestSceneRouter {
	private weak var view: BackgroundDownloadRequestSceneViewController?
}

extension BackgroundDownloadRequestSceneRouter: BackgroundDownloadRequestSceneRoutable {
	static func assembly() -> UIViewController {
		let router = BackgroundDownloadRequestSceneRouter()
		let vc                  = BackgroundDownloadRequestSceneViewController(nibName: String(describing: BackgroundDownloadRequestSceneViewController.self), bundle: Bundle.main)
		let viewModel           = BackgroundDownloadRequestSceneViewModel()
		let presenterService    = BackgroundDownloadRequestScenePresenterService(withModel: viewModel)
		let presenter           = BackgroundDownloadRequestScenePresenter(for: vc, service: presenterService)
		let interactorService   = BackgroundDownloadRequestSceneInteractorService(withModel: viewModel)
		let interactor          = BackgroundDownloadRequestSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: BackgroundDownloadRequestSceneViewController.self))")
		}
		
		return view
	}
	
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
