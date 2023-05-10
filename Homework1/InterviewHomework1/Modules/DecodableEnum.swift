//
//  DecodableEnum.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 5/9/23.
//

import Foundation

enum DecodableEnum<Enum: RawRepresentable> where Enum.RawValue == String {
    case value(Enum)
    case error(DecodingError)

    var value: Enum? {
        switch self {
        case .value(let value): return value
        case .error: return nil
        }
    }

    var error: DecodingError? {
        switch self {
        case .value: return nil
        case .error(let error): return error
        }
    }

    enum DecodingError: Error {
        case notDefined(rawValue: String)
        case decoding(error: Error)
    }
}

// MARK: Decodable

extension DecodableEnum: Decodable {
    init(from decoder: Decoder) throws {
        do {
            let rawValue = try decoder.singleValueContainer().decode(String.self)
            guard let layout = Enum(rawValue: rawValue) else {
                self = .error(.notDefined(rawValue: rawValue))
                return
            }
            self = .value(layout)
        } catch let err {
            self = .error(.decoding(error: err))
        }
    }
}

// MARK: Encodable

extension DecodableEnum: Encodable {
    func encode(to encoder: Encoder) throws {
        // TODO:!!!!
    }
}
