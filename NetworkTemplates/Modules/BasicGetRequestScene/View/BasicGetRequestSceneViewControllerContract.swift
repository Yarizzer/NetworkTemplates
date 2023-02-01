//
//  BasicGetRequestSceneViewControllerContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestSceneViewControllerType {
	func update(viewModelDataType: BasicGetRequestSceneViewControllerViewModel.ViewModelDataType)
}

struct BasicGetRequestSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: BasicGetRequestSceneViewModelType)
        case setupProvider(with: BasicGetRequestSceneViewModelType)
        case reloadData
	}
}
