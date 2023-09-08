//
//  BuilderViewState.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import Foundation

enum BuilderViewState {
    case adjectives, verbs, pronouns
    
    
}

enum BuilderLevels: CaseIterable, Identifiable {
    case one
    
    var id: String {
        UUID().uuidString
    }
    
    
}
