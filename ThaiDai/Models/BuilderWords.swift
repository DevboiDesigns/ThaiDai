//
//  BuilderWords.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import Foundation

enum BuilderWords: CaseIterable, Identifiable {
    case adjectives, pronouns, verbs
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        switch self {
        case .adjectives:
            return "Adjectives"
        case .pronouns:
            return "Pronouns"
        case .verbs:
            return "Verbs"
        }
    }
    
    var key: UserKeys {
        switch self {
        case .adjectives:
            return .adjectives
        case .pronouns:
            return .pronouns
        case .verbs:
            return .verbs
        }
    }
    
}
