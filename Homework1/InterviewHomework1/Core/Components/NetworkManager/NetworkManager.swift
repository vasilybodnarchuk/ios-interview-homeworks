//
//  NetworkManager.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 2/8/23.
//

import Foundation

class NetworkManager {
    private let session = URLSession.shared
    private let queue = DispatchQueue(label: "NetworkManagerQueue")
    
    init() { }
    
    private func createError(message: String, code: Int) -> Error {
        return NSError(domain: "dataManager", code: code, userInfo: ["message": message ])
    }
    
    enum NetworkError: Error {
        case dataTask(error: Error)
        case emptyData, incorrectDictionaryType
        case jsonSerialization(error: Error)
        case canNotBeCompleted
    }
    
    func make(request: URLRequest,
              completion: @escaping (Result<[String: Any], NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            self?.queue.async {
                guard let self = self else {
                    completion(.failure(.canNotBeCompleted))
                    return
                }
                completion(self.process(data: data, response: response, error: error))
            }
        }
        task.resume()
    }
    
    private func process(data: Data?,
                         response: URLResponse?,
                         error: Error?) -> Result<[String: Any], NetworkError> {
        if let error = error {
            return .failure(.dataTask(error: error))
        }
        
        guard let data = data else {
            return .failure(.emptyData)
        }
        
        do {
            guard let json = try JSONSerialization.jsonObject(with: data,
                                                              options: .mutableContainers) as? [String: Any] else {
                return .failure(.incorrectDictionaryType)
            }
            return .success(json)
            
        } catch let error {
            return .failure(.jsonSerialization(error: error))
        }
    }
}

// MARK: NetworkManagerable

extension NetworkManager: NetworkManagerable {
    
}
