//
//  BaseViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI
import Foundation

class BaseViewModel: ObservableObject {
    
    func save(_ items: [Word], key: String) {
        let encoded = try? JSONEncoder().encode(items)
        print("ENCODED")
        print(encoded)
        UserDefaults.standard.set(encoded, forKey: key)
    }
    
    func get() {
        
    }
    

}
