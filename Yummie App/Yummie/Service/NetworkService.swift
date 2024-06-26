//
//  NetworkService.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 14.05.2024.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func fetchAllFoods(completion: @escaping(Result<AllFoods, Error>) -> Void) {
        request(route: .fetchAllFoods, method: .get, completion: completion)
    }
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[PopularsSpecials], Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
    }
    
    func fetchOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    private func request<T: Decodable>(route: Route, method: Method, parameters: [String: Any]? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(YummieError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
            } else if let error = error {
                result = .failure(error)
                print("The error is : \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
        
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let result = result else {
            completion(.failure(YummieError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(YummieError.errorDecoding))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(YummieError.unknownError))
            }
            
            if let error = response.error {
                completion(.failure(YummieError.serverError(error)))
                return
            }
                
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// This function helps us to generate urlRequest
    /// - Parameters:
    ///   - route: the path the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: UrlRequest
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        
        guard let url = urlString.asURL else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post:
                let bodyData = try? JSONSerialization.data(withJSONObject: params)
                urlRequest.httpBody = bodyData
                
                
            }
        }
        return urlRequest
    }
}
