//
//  InitialSceneViewController.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
        topPaddingConstraint.constant = (AppCore.shared.deviceLayer.hasTopNotch ? Constants.topConstraintValueWithNotch : Constants.topConstraintValueWithoutNotch)
                
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    private var provider: TableViewProviderType?
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var tableView: UITableView!
}

extension InitialSceneViewController: InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.sceneTitle
        case .setupProvider(let model):
            guard let model = model as? InitialSceneViewModel else { return }
            
            provider = TableViewProvider(for: self.tableView, with: model)
            provider?.register(cells: [InitialSceneTableViewCell.self])
            provider?.onConfigureCell = { [weak self] indexPath in
                guard let provider = self?.provider else { return UITableViewCell() }
                
                let cell: InitialSceneTableViewCell = provider.dequeueReusableCell(for: indexPath)
                cell.setup(with: model.getCellViewModel(with: indexPath.row))
                
                return cell
            }
            provider?.onSelectCell = { [weak self] indexPath in
                self?.interactor?.makeRequest(requestType: .routeToScene(withType: model.getCellType(for: indexPath.row)))
            }
		}
	}
}

extension InitialSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
	}
}
