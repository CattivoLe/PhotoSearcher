//
//  NetworkService.swift
//  PhotoSearcher
//
//  Created by Александр Омельчук on 21.08.2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import Foundation

class NetworkService {
    
    //MARK: - Запрос данных по URL
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, compleation: completion)
        task.resume()
    }
    
    //MARK: - Prepare Metods
    
    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID 24be6d342be3ed739a5a6e2a0833cfcffff431a28fa1969fb03acd9479c637bc"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parametrs = [String: String]()
        parametrs["query"] = searchTerm // Ключевое слово для поиска
        parametrs["page"] = String(1) // Колличество страниц
        parametrs["per_page"] = String(30) // Колличество изображений в ответе
        return parametrs
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map {URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from reqest: URLRequest, compleation: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: reqest) { (data, response, error) in
            DispatchQueue.main.async {
                compleation(data, error)
            }
        }
    }
    
}
