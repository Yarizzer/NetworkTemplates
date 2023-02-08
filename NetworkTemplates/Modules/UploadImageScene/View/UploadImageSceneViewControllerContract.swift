//
//  UploadImageSceneViewControllerContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol UploadImageSceneViewControllerType {
	func update(viewModelDataType: UploadImageSceneViewControllerViewModel.ViewModelDataType)
}

struct UploadImageSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: UploadImageSceneViewModelType)
	}
}
