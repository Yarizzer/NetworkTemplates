//
//  FetchImageService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//

import Foundation

protocol FetchImageServiceType {
    var data: Publisher<Data?> { get }
    func fetchData()
}

class FetchImageService {
    var data: Publisher<Data?> = Publisher(nil)
}

extension FetchImageService: FetchImageServiceType {
    func fetchData() {
        guard let url = URL(string: Constants.imageFetcherSource) else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async { [weak self] in
                self?.data.value = data
            }
        }.resume()
    }
}

extension FetchImageService {
    private struct Constants {
        static let imageFetcherSource = "https://www.nasa.gov/sites/default/files/thumbnails/image/hubble_tde_stsci-01gnyg9m6kmyzyz2epkazscgdecrop2.jpg"
    }
}
