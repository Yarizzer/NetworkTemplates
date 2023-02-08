//
//  UploadImageSceneViewController.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class UploadImageSceneViewController: BaseViewController<UploadImageSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
	}
}

extension UploadImageSceneViewController: UploadImageSceneViewControllerType {
	func update(viewModelDataType: UploadImageSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
			print("\(self) \(#function) with model instance \(model)")
		}
	}
}

extension UploadImageSceneViewController {
	private struct Constants {
		
	}
}
