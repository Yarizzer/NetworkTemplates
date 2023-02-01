//
//  ImageDownloadSceneViewControllerContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol ImageDownloadSceneViewControllerType {
	func update(viewModelDataType: ImageDownloadSceneViewControllerViewModel.ViewModelDataType)
}

struct ImageDownloadSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: ImageDownloadSceneViewModelType)
        case updateImage(with: ImageDownloadSceneViewModelType)
	}
}
