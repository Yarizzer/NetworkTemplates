//
//  TableViewProviderType.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

protocol TableViewProviderType {
    var onConfigureCell:((IndexPath) -> UITableViewCell)? { get set }
    var onSelectCell: ((IndexPath) -> ())? { get set }
    func register(cells: [UITableViewCell.Type])
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell
    func reloadData(completion: @escaping() -> ()?)
}
