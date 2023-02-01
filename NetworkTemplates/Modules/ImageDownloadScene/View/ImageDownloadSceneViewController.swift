//
//  ImageDownloadSceneViewController.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ImageDownloadSceneViewController: BaseViewController<ImageDownloadSceneInteractable> {
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
    
    @IBAction private func runDownloadButtonAction(_ sender: UIButton) {
        activityIndicator.alpha = Constants.maxAlphaValue
        activityIndicator.startAnimating()
        interactor?.makeRequest(requestType: .downloadImage)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backButton: BackButton!
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
}

extension ImageDownloadSceneViewController: ImageDownloadSceneViewControllerType {
	func update(viewModelDataType: ImageDownloadSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.sceneTitle
            imageView.alpha = Constants.minAlphaValue
            activityIndicator.alpha = Constants.minAlphaValue
        case .updateImage(let model):
            guard let imageData = model.imageData, let image = UIImage(data: imageData) else { return }
            
            imageView.image = image
            activityIndicator.stopAnimating()
            
            UIView.animate(withDuration: Constants.animationDuration, delay: 0) { [weak self] in
                self?.imageView.alpha = Constants.maxAlphaValue
                self?.activityIndicator.alpha = Constants.minAlphaValue
            }
		}
	}
}

extension ImageDownloadSceneViewController {
	private struct Constants {
        static let minAlphaValue: CGFloat = 0.0
        static let maxAlphaValue: CGFloat = 1.0
        
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
        
        static let animationDuration: Double = 1
	}
}
