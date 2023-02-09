//
//  BackgroundDownloadRequestSceneViewController.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class BackgroundDownloadRequestSceneViewController: BaseViewController<BackgroundDownloadRequestSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        backButton.appear()
    }
	
	private func setup() {
        topPaddingConstraint.constant = (AppCore.shared.deviceLayer.hasTopNotch ? Constants.topConstraintValueWithNotch : Constants.topConstraintValueWithoutNotch)
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    @IBAction private func backButtonAction(_ sender: BackButton) {
        interactor?.makeRequest(requestType: .routeBack)
    }
    
    @IBAction private func tapMeButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .sendDownloadRequest)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backButton: BackButton!
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    
}

extension BackgroundDownloadRequestSceneViewController: BackgroundDownloadRequestSceneViewControllerType {
	func update(viewModelDataType: BackgroundDownloadRequestSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.sceneTitle
            progressLabel.text = model.progressLabel
            progressView.progress = model.progress
        case .updateProgress(let model):
            progressView.progress = model.progress
            progressLabel.text = model.progressLabel
		}
	}
}

extension BackgroundDownloadRequestSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
	}
}
