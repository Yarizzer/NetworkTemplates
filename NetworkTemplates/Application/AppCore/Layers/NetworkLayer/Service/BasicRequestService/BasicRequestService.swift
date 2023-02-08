//
//  BasicRequestService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//

import Foundation

enum BasicRequestType {
    case get, post(withData: BasicRequestModel)
}

protocol BasicRequestServiceType {
    var data: Publisher<[BasicRequestModel]?> { get }
    func fetchData(for type: BasicRequestType)
}

class BasicRequestService {
    var data: Publisher<[BasicRequestModel]?> = Publisher(nil)
}

extension BasicRequestService: BasicRequestServiceType {
    func fetchData(for type: BasicRequestType) {
        switch type {
        case .get:
            guard let url = URL(string: Constants.source) else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == Constants.successStatusCode else { return }
                
                var resultToReturn = [BasicRequestModel]()
                
                do {
                    resultToReturn = try JSONDecoder().decode([BasicRequestModel].self, from: data)
                } catch {
                    print(error)
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.data.value = resultToReturn
                }
            }.resume()
        case .post(let data):
            guard let url = URL(string: Constants.source) else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = Constants.httpMethod
            request.addValue(Constants.requestValue, forHTTPHeaderField: Constants.headerFieldValue)
            
            guard let body = try? JSONSerialization.data(withJSONObject: data.prepareForJSON(), options: []) else { return }

            request.httpBody = body
            
            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == Constants.createdStatusCode else { return }
                
                var newItem: BasicRequestModel?
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    writeLog(type: .debug, message: "Got json from data")
                    
                    newItem = try JSONDecoder().decode(BasicRequestModel.self, from: data)
                } catch {
                    print(error)
                }
                
                guard let newItem = newItem else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.data.value?.append(newItem)
                }
            } .resume()
        }
    }
}

extension BasicRequestService {
    private struct Constants {
        static let source = "https://jsonplaceholder.typicode.com/posts"
        static let httpMethod = "POST"
        static let requestValue = "application/json"
        static let headerFieldValue = "Content-Type"
        static let successStatusCode = 200
        static let createdStatusCode = 201
    }
}
