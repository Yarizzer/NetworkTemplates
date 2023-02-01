//
//  TableViewProviderViewModelType.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

protocol TableViewProviderViewModelType {
    var numberOfSection: Int { get }
    func numberOfRowsIn(section: Int) -> Int
    func heightForRow(at index: Int) -> Float
}
