//
//  BackgroundDownloadRequestSceneViewControllerContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestSceneViewControllerType {
	func update(viewModelDataType: BackgroundDownloadRequestSceneViewControllerViewModel.ViewModelDataType)
}

struct BackgroundDownloadRequestSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: BackgroundDownloadRequestSceneViewModelType)
        case updateProgress(with: BackgroundDownloadRequestSceneViewModelType)
	}
}
