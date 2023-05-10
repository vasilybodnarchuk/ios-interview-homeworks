//
//  ItunesRepository.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 2/8/23.
//

import Foundation

class ItunesRepository {
    
    private let queue = DispatchQueue(label: "ItunesRepository")
    private lazy var networkManager = NetworkManager()
    init () {
        searchRequest(term: "matrix") { json, error in
            print("!!!!! \(json)")
        }
    }
    
    // TODO: move url and request inside networkManager.zxa
    func searchRequest(term: String, closure: ((_ json: [String: Any]?, _ error: Error?)->Void)?) {
        let url = URL(string: "https://itunes.apple.com/search?term=\(term.replacingOccurrences(of: " ", with: "+"))")
        let request = URLRequest(url: url!)
        networkManager.dictionary(from: request) { result in
            print("!!!! \(result)")
        }
    }
}
