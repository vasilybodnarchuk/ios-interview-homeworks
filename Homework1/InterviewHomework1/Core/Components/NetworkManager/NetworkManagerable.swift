//
//  NetworkManagerable.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 2/8/23.
//

import Foundation

// MARK: NetworkManagerable

protocol NetworkManagerable: AnyObject {
    func dictionary(from request: URLRequest,
                    session: URLSession,
                    jsonReadingOptions: JSONSerialization.ReadingOptions,
                    completion: @escaping (Result<[String: Any], NetworkManagerError>) -> Void)
    func dictionary(from request: URLRequest,
                    session: URLSession,
                    jsonReadingOptions: JSONSerialization.ReadingOptions) async -> Result<[String: Any], NetworkManagerError>
   
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest,
                        session: URLSession,
                        completion: @escaping (Result<Value, NetworkManagerError>) -> Void) where Value: Codable
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest,
                        session: URLSession) async -> Result<Value, NetworkManagerError> where Value: Codable
}

extension NetworkManagerable {
    func dictionary(from request: URLRequest,
                    jsonReadingOptions: JSONSerialization.ReadingOptions = .mutableContainers,
                    completion: @escaping (Result<[String: Any], NetworkManagerError>) -> Void) {
        dictionary(from: request,
                   session: .shared,
                   jsonReadingOptions: jsonReadingOptions,
                   completion: completion)
    }
    
    func dictionary(from request: URLRequest,
                    jsonReadingOptions: JSONSerialization.ReadingOptions = .mutableContainers) async -> Result<[String: Any], NetworkManagerError> {
        await dictionary(from: request, session: .shared, jsonReadingOptions: jsonReadingOptions)
    }
    
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest,
                        completion: @escaping (Result<Value, NetworkManagerError>) -> Void) where Value: Codable {
        codable(type, from: request, session: .shared, completion: completion)
    }
    
    func codable<Value>(_ type: Value.Type,
                        from request: URLRequest) async -> Result<Value, NetworkManagerError> where Value: Codable {
        await codable(type, from: request, session: .shared)
    }
}

// MARK: NetworkManager Errors

enum NetworkManagerError: Error {
    case dataTask(error: Error)
    case emptyData
    case jsonSerialization(error: Error)
    case castingError(value: Any, isNot: Any)
    case networkMangerIsNotExists
    case jsonDecoding(error: Error)
}
