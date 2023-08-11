//
//  Bundle+.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle")
        }
        
        print("FILE URL: \(url)")
        
        // 2. Create a Property for Data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in Bundle")
        }
        
        print("FILE DATA: \(data)")
        
        // 3. Create a Decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        // 5. Return the ready-to-use Data
        return loaded
        
    }
}
