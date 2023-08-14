//
//  NetworkManager.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 2/8/23.
//

import Foundation

// MARK: NetworkManager

class NetworkManager {
    private func data(from request: URLRequest,
                      session: URLSession,
                      completion: @escaping (Result<Data, NetworkManagerError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.dataTask(error: error)))
                return
            }
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}

// MARK: NetworkManagerable

extension NetworkManager: NetworkManagerable { }


// MARK: Receive Codable

extension NetworkManager {
    private func codable<Value>(_ type: Value.Type,
                                from data: Data) -> Result<Value, NetworkManagerError>
    where Value : Decodable, Value : Encodable {
        do {
            let codableValue = try JSONDecoder().decode(Value.self, from: data)
            return .success(codableValue)
        } catch let error {
            return .failure(.jsonDecoding(error: error))
        }
    }
    
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest,
                        session: URLSession,
                        completion: @escaping (Result<Value, NetworkManagerError>) -> Void)
    where Value : Decodable, Value : Encodable {
        data(from: request, session: session) { [weak self] result in
            guard let self = self else {
                completion(.failure(.networkMangerIsNotExists))
                return
            }
            switch result {
            case let .success(data):
                return completion(self.codable(type, from: data))
            case let .failure(error):
                return completion(.failure(error))
            }
        }
    }
    
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest,
                        session: URLSession) async -> Result<Value, NetworkManagerError> where Value : Decodable, Value : Encodable {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return codable(type, from: data)
        } catch let error {
            return .failure(.dataTask(error: error))
        }
    }
}

// MARK: Receive Dictionary

extension NetworkManager {
    
    private func dictionary(from data: Data,
                            jsonReadingOptions: JSONSerialization.ReadingOptions) -> Result<[String: Any], NetworkManagerError> {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: jsonReadingOptions)
            guard let dictionary = json as? [String: Any] else {
                return .failure(.castingError(value: json, isNot: [String: Any].self))
            }
            return .success(dictionary)
            
        } catch let error {
            return .failure(.jsonSerialization(error: error))
        }
    }
    
    func dictionary(from request: URLRequest,
                    session: URLSession = .shared,
                    jsonReadingOptions: JSONSerialization.ReadingOptions = .mutableContainers,
                    completion: @escaping (Result<[String: Any], NetworkManagerError>) -> Void) {
        data(from: request, session: session) { [weak self] result in
            guard let self = self else {
                completion(.failure(.networkMangerIsNotExists))
                return
            }
            switch result {
            case let .success(data):
                return completion(self.dictionary(from: data, jsonReadingOptions: jsonReadingOptions))
            case let .failure(error):
                return completion(.failure(error))
            }
        }
    }
    
    func dictionary(from request: URLRequest,
                    session: URLSession,
                    jsonReadingOptions: JSONSerialization.ReadingOptions) async -> Result<[String: Any], NetworkManagerError> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return self.dictionary(from: data, jsonReadingOptions: jsonReadingOptions)
        } catch let error {
            return .failure(.dataTask(error: error))
        }
    }
}
