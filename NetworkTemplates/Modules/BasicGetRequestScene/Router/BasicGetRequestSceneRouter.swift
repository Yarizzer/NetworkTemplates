//
//  BasicGetRequestSceneRouter.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol BasicGetRequestSceneRoutable {
	static func assembly() -> UIViewController
    func dismiss()
}

class BasicGetRequestSceneRouter {
	private weak var view: BasicGetRequestSceneViewController?
}

extension BasicGetRequestSceneRouter: BasicGetRequestSceneRoutable {
    static func assembly() -> UIViewController {
        let router = BasicGetRequestSceneRouter()
        let vc                  = BasicGetRequestSceneViewController(nibName: String(describing: BasicGetRequestSceneViewController.self), bundle: Bundle.main)
        let viewModel           = BasicGetRequestSceneViewModel()
        let presenterService    = BasicGetRequestScenePresenterService(withModel: viewModel)
        let presenter           = BasicGetRequestScenePresenter(for: vc, service: presenterService)
        let interactorService   = BasicGetRequestSceneInteractorService(withModel: viewModel)
        let interactor          = BasicGetRequestSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
        
        router.view = vc
        
        router.view?.interactor = interactor
        
        guard let view = router.view else {
            fatalError("cannot instantiate \(String(describing: BasicGetRequestSceneViewController.self))")
        }
        
        return view
    }
    
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
