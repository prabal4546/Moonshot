//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by PRABALJIT WALIA     on 26/09/20.
//

import Foundation
extension Bundle {
    //Making the method Generic
    func decode<T:Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
