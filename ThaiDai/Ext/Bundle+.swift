//
//  Bundle+.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ key: FileKeys) -> T {
        guard let url = self.url(forResource: key.fileName, withExtension: nil) else {
            fatalError("Failed to locate \(key.fileName) in Bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(key.fileName) in Bundle")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(key.fileName) from bundle")
        }
        return loaded
    }
}
