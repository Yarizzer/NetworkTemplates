//
//  BasicPostRequestSceneViewControllerContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestSceneViewControllerType {
	func update(viewModelDataType: BasicPostRequestSceneViewControllerViewModel.ViewModelDataType)
}

struct BasicPostRequestSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: BasicPostRequestSceneViewModelType)
        case updateData(with: BasicPostRequestSceneViewModelType)
	}
}
