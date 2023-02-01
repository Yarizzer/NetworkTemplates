//
//  TableViewProvider.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

class TableViewProvider: NSObject {
    init(for tableView: UITableView, with model: TableViewProviderViewModelType) {
        self.tableView = tableView
        self.model = model
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    var onConfigureCell: ((IndexPath) -> UITableViewCell)?
    var onSelectCell: ((IndexPath) -> ())?
    
    private var tableView: UITableView
    private var model: TableViewProviderViewModelType
}

extension TableViewProvider: TableViewProviderType {
    func register(cells: [UITableViewCell.Type]) {
        cells.forEach { registerCell($0) }
    }
    
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T : UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
    
    private func registerCell<T>(_ type: T.Type) where T: UITableViewCell {
        if let nibLoadableType = type as? NibLoadableView.Type {
            let nib = UINib(nibName: nibLoadableType.nibName, bundle: Bundle(for: type.self))
            tableView.register(nib, forCellReuseIdentifier: String(describing: type))
        } else {
            tableView.register(type.self, forCellReuseIdentifier: String(describing: type))
        }
    }

    func reloadData(completion: @escaping() -> ()?) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            completion()
        }
    }
}

extension TableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let onConfigureCell = onConfigureCell else { fatalError("Need to init onConfigureCell") }
                
        return onConfigureCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(model.heightForRow(at: indexPath.row))
    }
}

extension TableViewProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        onSelectCell?(indexPath)
    }
}
