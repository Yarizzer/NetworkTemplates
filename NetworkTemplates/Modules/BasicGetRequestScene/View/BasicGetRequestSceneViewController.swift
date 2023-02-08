//
//  BasicGetRequestSceneViewController.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class BasicGetRequestSceneViewController: BaseViewController<BasicGetRequestSceneInteractable> {
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
    
    @IBAction private func sendRequestButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .sendRequest)
    }
    
    private var provider: TableViewProviderType?
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backButton: BackButton!
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var tableView: UITableView!
}

extension BasicGetRequestSceneViewController: BasicGetRequestSceneViewControllerType {
	func update(viewModelDataType: BasicGetRequestSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.sceneTitle
        case .setupProvider(let model):
            guard let model = model as? BasicGetRequestSceneViewModel else { return }
            
            provider = TableViewProvider(for: self.tableView, with: model)
            provider?.register(cells: [BasicRequestTableViewCell.self])
            provider?.onConfigureCell = { [weak self] indexPath in
                guard let provider = self?.provider, let cellModel = model.getCellViewModel(with: indexPath.row) else { return UITableViewCell() }
                
                let cell: BasicRequestTableViewCell = provider.dequeueReusableCell(for: indexPath)
                cell.setup(with: cellModel)
                
                return cell
            }
        case .reloadData:
            provider?.reloadData {}
		}
	}
}

extension BasicGetRequestSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
	}
}
