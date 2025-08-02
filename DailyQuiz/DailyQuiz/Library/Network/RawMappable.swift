//
//  RawMappable.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

/// Dictionary of type `[String: Any]`.
public typealias Json = [String: Any]

/// Composition of ``RawEncodable`` and ``RawDecodable``.
public typealias RawMappable = RawEncodable & RawDecodable

/// Describes an entity from the lower DTO layer.
/// Can convert itself to RAW (for example, ``Json``).
public protocol RawEncodable {

    /// Data type to which models are mapped. For example, ``Json``.
    associatedtype Raw

    /// Converts the model to RAW.
    /// - Returns: The RAW representation of the model.
    /// - Throws: Any user-defined exceptions may occur.
    func toRaw() throws -> Raw
}

/// Describes an entity from the lower DTO layer.
/// Can map RAW to itself.
public protocol RawDecodable {

    /// Data type to which models are mapped. For example, ``Json``.
    associatedtype Raw

    /// Converts data in RAW format to a model.
    ///
    /// - Parameter from: Data in RAW format.
    /// - Returns: The model obtained from RAW.
    /// - Throws: Any user-defined exceptions may occur.
    static func from(raw: Raw) throws -> Self
}

/// Contains errors that the `Codable` mapper can return.
public enum RawMappableCodableError: Error {
    /// Indicates that the model cannot be converted to JSON using `JSONEncoder`
    case cantMapObjectToRaw
}

/// Default implementation for models that implement the Encodable protocol for JSON
public extension RawEncodable where Self: Encodable, Raw == [String: Any] {
    func toRaw() throws -> Raw {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let dict = jsonObject as? [String: Any] else {
            throw RawMappableCodableError.cantMapObjectToRaw
        }
        return dict
    }
}

/// Default implementation for models that implement the Encodable protocol for JSON
public extension RawDecodable where Self: Decodable, Raw == [String: Any] {
    static func from(raw: Raw) throws -> Self {
        let decoder = JSONDecoder()
        let data = try JSONSerialization.data(withJSONObject: raw, options: .prettyPrinted)
        return try decoder.decode(Self.self, from: data)
    }
}
